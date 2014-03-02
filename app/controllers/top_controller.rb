class TopController < ApplicationController
  def index
    @datetime = datetime_of_query
  end

  def search_station
    name = params[:station]
    @stations = Station.where('name LIKE :m', :m => "%#{name}%")
  end

  def search_train
    name = params[:from_station]
    @from_stations = Station.where('name LIKE :m', :m => "%#{name}%")

    name = params[:to_station]
    @to_stations = Station.where('name LIKE :m', :m => "%#{name}%")

    year = params[:date][:year].to_i
    month = params[:date][:month].to_i
    day = params[:date][:day].to_i
    hour = params[:date][:hour].to_i
    min = params[:date][:minute].to_i

    @datetime = DateTime.new(year, month, day, hour, min, 0, '+8')
    set_datetime_of_query(@datetime)

    @query_depart = params[:query_type] == 'depart'
    @query_arrive = params[:query_type] == 'arrive'
    @superexpress = params[:superexpress] == 'true'
    @express = params[:express] == 'true'
  end
end
