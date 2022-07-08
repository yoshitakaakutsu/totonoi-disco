class Public::RecordsController < ApplicationController
  def index
    @record = Record.new
  end
  
  def show
    @record = Record.find(params[:id])
  end
  
  def new
  end
  
  private
  
  def record_params
    params.require(:record).permit(:sauna_name,:sauna_tempreture,:water_temprature,:tempreture,:wether,:sets,:sauna_time,:water_time,:totonoi_time,:sauna_type,:rouryu,:totonoi_ratio)
  end
end
