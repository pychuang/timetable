class TopController < ApplicationController
  def index
  end

  def search_station
    name = params[:station]
    @stations = Station.where('name LIKE :m', :m => "%#{name}%")
  end

  def search_train
  end
end
