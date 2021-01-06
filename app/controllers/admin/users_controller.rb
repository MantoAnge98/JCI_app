class Admin::UsersController < ApplicationController
  before_action :admin_check
  before_action :set_user, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user!, except: %i[index show]


  def index 
    @users = User.all.order('created_at DESC').page params[:page]
  end

  def new
    @group = Group.all
    @user = User.new
  end

  def create
    @group = Group.all
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User created!"
      redirect_to admin_users_path
    else
      flash[:danger] = "Error"
      render :new
    end
  end
  
  def show
    @payment = Payment.all
    @user = User.find(params[:id]) 
  end
  
  def edit
    
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "User updated!"
      redirect_to admin_users_path
    else
      if current_user.admin?
        flash[:danger] = 'Please choose another administrator before because you are currently the only administrator.'
        render :new
      else
        flash[:danger] = 'Something wrong !!'
        render :new
      end
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if (current_user == @user) && (current_user.admin?)
      flash[:danger] = "Can not delete own admin account!"
      redirect_to admin_users_path
    else
      @user.destroy
      flash[:success] = "User destroyed."
      redirect_to admin_users_path
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :first_name, :email, :telephone, :added_since, :group_id, :setting_id, :admin, :password, :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def admin_check
    unless current_user.admin?
      redirect_to root_path, notice: "Only Admin can Logged"
    end
  end
end
