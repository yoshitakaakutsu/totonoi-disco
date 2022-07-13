class Public::RecordsController < ApplicationController
  def index
    @record = Record.new
    @records = current_user.records
  end
  
  def show
    @record = Record.find(params[:id])
  end
  
  def new
    record = Record.new
  end
  
    
  def create
    record = Record.new(record_params)
    record.user_id = current_user.id
    record.save
    redirect_to public_records_path
  end
  
  def edit 
    @record = Record.find(params[:id])
  end
  
  def update
    record = Record.find(params[:id])
    record.user_id = current_user.id
    record.update(record_params)
    redirect_to public_records_path
  end
  
  def destroy
    record = Record.find(params[:id])
    record.destroy
    redirect_to public_records_path
  end
  
  private
  
  def record_params
    params.require(:record).permit(:sauna_name,:sauna_tempureture,:water_tempurature,:tempreture,:wether,:sets,:sauna_time,:water_time,:totonoi_time,:sauna_type,:rouryu,:totonoi_ratio, :user_id)
  end
end
