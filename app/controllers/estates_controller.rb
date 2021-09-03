class EstatesController < ApplicationController
  before_action :set_estate, only: %i[ show edit update destroy ]

  def index
    @estates = Estate.all
  end

  def show
    @near_stations = @estate.near_stations
  end

  def new
    @estate = Estate.new
    2.times { @estate.near_stations.build }
  end

  def edit
    @estate.near_stations.build
  end

  def create
    @estate = Estate.new(estate_params)
    if @estate.save
      flash[:notice] = "物件情報を登録しました！"
      redirect_to estates_path
    else
      render :new
    end
  end

  def update
    if @estate.update(estate_params)
      redirect_to estates_path, notice: "情報を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @estate.destroy
    respond_to do |format|
      format.html { redirect_to estates_url, notice: "物件情報を削除しました！" }
      format.json { head :no_content }
    end
  end

  private

  def set_estate
    @estate = Estate.find(params[:id])
  end

  def estate_params
    params.require(:estate).permit(:name, :price, :adress, :age, :content, near_stations_attributes: [:line, :station_name, :time_on_foot, :estate_id])
  end
end
