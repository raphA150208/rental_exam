class NearStationsController < ApplicationController
  before_action :set_near_station, only: %i[ show edit update destroy ]

  # GET /near_stations or /near_stations.json
  def index
    @near_stations = NearStation.all
  end

  # GET /near_stations/1 or /near_stations/1.json
  def show
  end

  # GET /near_stations/new
  def new
    @near_station = NearStation.new
  end

  # GET /near_stations/1/edit
  def edit
  end

  # POST /near_stations or /near_stations.json
  def create
    @near_station = NearStation.new(near_station_params)

    respond_to do |format|
      if @near_station.save
        format.html { redirect_to @near_station, notice: "Near station was successfully created." }
        format.json { render :show, status: :created, location: @near_station }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @near_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /near_stations/1 or /near_stations/1.json
  def update
    respond_to do |format|
      if @near_station.update(near_station_params)
        format.html { redirect_to @near_station, notice: "Near station was successfully updated." }
        format.json { render :show, status: :ok, location: @near_station }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @near_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /near_stations/1 or /near_stations/1.json
  def destroy
    @near_station.destroy
    respond_to do |format|
      format.html { redirect_to near_stations_url, notice: "Near station was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_near_station
      @near_station = NearStation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def near_station_params
      params.require(:near_station).permit(:line, :station_name, :time_on_foot)
    end
end
