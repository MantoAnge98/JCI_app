class Admin::SettingsController < ApplicationController
  before_action :set_setting, only: %i[show edit update destroy]
  before_action :authenticate_user!
  before_action :authenticate_admin!

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
      redirect_to admin_settings_path, notice: "Paramètre enregistré!"
    else
      render :new
    end
  end

  def update
    if @setting.update(setting_params)
      redirect_to admin_settings_path, notice: "Paramètre mise à jour avec succès!"
    else
      render :edit 
    end
  end

  def destroy
    @setting.destroy
    redirect_to admin_settings_path, notice: "Paramètre supprimé avec succès!"
  end
  
  private 
  def authenticate_admin! 
    unless current_user.admin?
      flash[:info] = "Vous n'avez pas les privilèges pour accéder à cette page."
      redirect_to root_path
    end
  end

  def setting_params
    params.require(:setting).permit(:amount_due, :devise, :user_id)
  end

  def set_setting
    @setting = Setting.find(params[:id])
  end
end