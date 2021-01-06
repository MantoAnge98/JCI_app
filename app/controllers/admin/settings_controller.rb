class Admin::SettingsController < ApplicationController
  before_action :admin_check
  before_action :set_setting, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @user = User.all
    @settings = Setting.all.order('created_at DESC').page params[:page]
  end

  def new
    @setting = Setting.new
  end

  def edit
    @setting = Setting.find(params[:id])
  end

  def show 
    @setting = Setting.find(params[:id])
  end

  def create
    @setting = Setting.new(setting_params)
    if @setting.save
      redirect_to admin_settings_path, notice: "Setting saved!"
    else
      render :new
    end
  end

  def update
    if @setting.update(setting_params)
      redirect_to admin_settings_path, notice: "Setting updated!"
    else
      render :edit 
    end
  end

  def destroy
    @setting.destroy
    redirect_to admin_settings_path, notice: "Setting deleted!"
  end
  
  private
  def admin_check
    unless current_user.admin?
      redirect_to root_path, notice: "Only Admin can Logged"
    end
  end

  def setting_params
    params.permit(:amount_due, :devise, :user_id)
  end

  def set_setting
    @setting = Setting.find(params[:id])
  end
end