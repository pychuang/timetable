require 'yaml'

namespace :import do
  def create_station_if_not_exist(company, name)
    station = Station.where(:company_id => company.id, :name => name).first
    if station.nil?
      puts "CREATE STATION #{name}"
      station = Station.create(:company_id => company.id, :name => name)
    end
    station
  end

  # Usage: rake import:trains[path/to/<timetable>.yaml]
  task :trains, [:filename] => :environment do |task, args|
    print "loading #{args[:filename]} ... "
    trains = YAML.load_file(args[:filename])
    puts 'done'
    trains.each do |t|
      company = Company.find_by_abbrev(t[:company])
      rank = t[:rank]
      name = t[:name]
      clockwise = t[:clockwise]
      number = t[:number]
      origin = create_station_if_not_exist(company, t[:origin])
      destination = create_station_if_not_exist(company, t[:destination])
      date = t[:schedule][0][:depart_at].to_date

      if Train.where(:company_id => company.id, :number => number, :date => date).empty?
        puts "CREATE TRAIN #{date} #{number} #{name}"
        train = Train.create(:company_id => company.id,
                         :rank => rank,
                         :name => name,
                         :clockwise => clockwise,
                         :number => number,
                         :origin_id => origin.id,
                         :destination_id => destination.id,
                         :date => date)
        t[:schedule].each do |edge|
          depart_from = create_station_if_not_exist(company, edge[:depart_from])
          depart_at = edge[:depart_at]
          arrive_to = create_station_if_not_exist(company, edge[:arrive_to])
          arrive_at = edge[:arrive_at]
          #puts "  #{depart_from.name} #{depart_at} -> #{arrive_to.name} #{arrive_at}"
          Travel.create(:train_id => train.id,
                        :depart_from_id => depart_from.id, :depart_at => depart_at,
                        :arrive_to_id => arrive_to.id, :arrive_at => arrive_at)
        end
      else
        puts "#{date} #{number} #{name} is already in database"
      end
    end
  end
end
