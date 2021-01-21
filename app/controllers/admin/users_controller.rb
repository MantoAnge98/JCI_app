class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user!, except: %i[index show]
  before_action :authenticate_admin!

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
      flash[:success] = "Utilisateur créé avec succès!"
      redirect_to admin_users_path
    else
      flash[:danger] = "Erreur de création, veuillez réessayer !"
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
      flash[:success] = "Utilisateur mise à jour avec succès!"
      redirect_to admin_users_path
    else
      if current_user.admin?
        flash[:danger] = 'Veuillez choisir un autre administrateur avant car vous êtes actuellement le seul administrateur.'
        render :new
      else
        flash[:danger] = 'Erreur de mise à jour, veuillez réessayer!'
        render :new
      end
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if (current_user == @user) && (current_user.admin?)
      flash[:danger] = "Vous ne pouvez pas supprimé votre compte"
      redirect_to admin_users_path
    else
      @user.destroy
      flash[:success] = "Utilisateur supprimé"
      redirect_to admin_users_path
    end
  end
  
  private
  def authenticate_admin! 
    unless current_user.admin?
      flash[:info] = "Vous n'avez pas les privilèges pour accéder à cette page."
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :first_name, :email, :avatar, :avatar_cache, :telephone, :added_since, :birthday, :profession, :promotion_id, :group_id, :setting_id, :admin, :password, :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
