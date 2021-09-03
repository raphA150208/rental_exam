class EstatesController < ApplicationController
  before_action :set_estate, only: %i[ show edit update destroy ]

  # GET /estates or /estates.json
  def index
    @estates = Estate.all
  end

  # GET /estates/1 or /estates/1.json
  def show
    @near_stations = @estate.near_stations
  end

  # GET /estates/new
  def new
    @estate = Estate.new
    2.times { @estate.near_stations.build }
  end

  # GET /estates/1/edit
  def edit
    @estate.near_stations.build
  end

  # POST /estates or /estates.json
  def create
    @estate = Estate.new(estate_params)
    if @estate.save
      flash[:notice] = "物件情報を登録しました！"
      redirect_to estates_path
    else
      render :new
    end
  end

  # PATCH/PUT /estates/1 or /estates/1.json
  def update
    respond_to do |format|
      if @estate.update(estate_params)
        redirect_to estates_path, notice: "情報を編集しました！"
      else
        render :edit
      end
    end
  end

  # DELETE /estates/1 or /estates/1.json
  def destroy
    @estate.destroy
    respond_to do |format|
      format.html { redirect_to estates_url, notice: "物件情報を削除しました！" }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_estate
    @estate = Estate.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def estate_params
    params.require(:estate).permit(:name, :price, :adress, :age, :content, near_stations_attributes: [:line, :station_name, :time_on_foot, :estate_id])
  end
end
