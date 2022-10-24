class Public::RecordsController < ApplicationController
  def index
    @records = current_user.records.all
  end

  def show
    @record = Record.find(params[:id])
  end

  def new
    @record = Record.new
  end


  def create
    @record = Record.new(record_params)
    @record.user_id = current_user.id
    if @record.save!
      redirect_to public_user_path(current_user.id)
    else
      render :new
    end
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    record = Record.find(params[:id])
    record.user_id = current_user.id
    record.update(record_params)
    redirect_to public_user_path(current_user.id)
  end

  def destroy
    record = Record.find(params[:id])
    record.destroy
    redirect_to public_user_path(current_user.id)
  end

  private

  def record_params
    params.require(:record).permit(:sauna_name,:sauna_tempureture,:water_tempurature,:tempreture,:wether,:sets,:sauna_time,:water_time,:totonoi_time,:sauna_type,:rouryu,:totonoi_ratio, :user_id, :start_time)
  end
end
