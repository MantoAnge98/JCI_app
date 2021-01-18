class Api::V1::SettingsController < ApplicationController
  before_action :set_setting, only: %i[index]
  before_action :authenticate_user! 
  def index
    @user = User.all
    @settings = Setting.all
    render json: @settings
  end

  def show 
    @setting = Setting.find(params[:id])
  end

  private
  def setting_params
    params.permit(:amount_due, :devise, :user_id)
  end 

  def set_setting
    @setting = Setting.find_by(params[:id])
  end
 
end
