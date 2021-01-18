class Api::V1::UsersController < ApplicationController 
  before_action :authenticate_user!
  before_action :set_user, only:[:show]
  before_action :acces

  def index
    @payments = Payment.all  
    @user = current_user
  end

  def show 
    @user = User.find_by_id(params[:id])
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
 
  def acces 
    if @user.id != current_user.id 
      redirect_to root_path, notice: "Accès refusé"
    end
  end
  
end
