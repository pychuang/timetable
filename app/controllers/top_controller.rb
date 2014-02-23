class TopController < ApplicationController
  def index
  end

  def search_station
    @stations = Station.search(params[:station])
  end

  def search_train
  end
end
