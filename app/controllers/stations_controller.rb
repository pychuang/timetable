class StationsController < ApplicationController
  def update_datetime_of_query
    if not params[:date].nil?
      year = params[:date][:year].to_i
      month = params[:date][:month].to_i
      day = params[:date][:day].to_i

      set_datetime_of_query(DateTime.new(year, month, day, 0, 0, 0, '+8'))
    end
  end

  # GET /stations
  # GET /stations.json
  def index
    @stations = Station.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stations }
    end
  end

  # GET /stations/1
  # GET /stations/1.json
  def show
    update_datetime_of_query
    @date_in_question = datetime_of_query.to_date

    beginning = datetime_of_query.beginning_of_day

    @station = Station.find(params[:id])
    @clockwise_travels = @station.departures.includes(:train).
      where(:depart_at => beginning...beginning+1).
      where('trains.clockwise' => true).order('depart_at')

    @counterclockwise_travels = @station.departures.includes(:train).
      where(:depart_at => beginning...beginning+1).
      where('trains.clockwise' => false).order('depart_at')

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @station }
    end
  end

  # GET /stations/new
  # GET /stations/new.json
  def new
    @station = Station.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @station }
    end
  end

  # GET /stations/1/edit
  def edit
    @station = Station.find(params[:id])
  end

  # POST /stations
  # POST /stations.json
  def create
    @station = Station.new(params[:station])

    respond_to do |format|
      if @station.save
        format.html { redirect_to @station, notice: 'Station was successfully created.' }
        format.json { render json: @station, status: :created, location: @station }
      else
        format.html { render action: "new" }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stations/1
  # PUT /stations/1.json
  def update
    @station = Station.find(params[:id])

    respond_to do |format|
      if @station.update_attributes(params[:station])
        format.html { redirect_to @station, notice: 'Station was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stations/1
  # DELETE /stations/1.json
  def destroy
    @station = Station.find(params[:id])
    @station.destroy

    respond_to do |format|
      format.html { redirect_to stations_url }
      format.json { head :no_content }
    end
  end
end
