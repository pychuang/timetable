class TopController < ApplicationController
  def index
    @datetime = datetime_of_query
  end

  def search_station
    @stations = Station.search(params[:station])
  end

  def search_train
    @from_stations = Station.search(params[:from_station])
    @to_stations = Station.search(params[:to_station])

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

  def search_train2
    @from_station = Station.find(params[:from_station].to_i)
    @to_station = Station.find(params[:to_station].to_i)

    year = params[:date][:year].to_i
    month = params[:date][:month].to_i
    day = params[:date][:day].to_i
    hour = params[:date][:hour].to_i
    min = params[:date][:minute].to_i

    @datetime = DateTime.new(year, month, day, hour, min, 0, '+8')
    set_datetime_of_query(@datetime)

    @query_type = params[:query_type]
    @superexpress = params[:superexpress] == 'true'
    @express = params[:express] == 'true'
  end
end
