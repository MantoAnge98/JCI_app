class Admin::GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def index
    @user = User.all
    @groups = Group.all.order('created_at DESC').page params[:page]
  end

  def new
    @group = Group.new
  end

  def edit
    @group = Group.find(params[:id])
  end
  

  def show 
    @group = Group.find(params[:id])
  end
  

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to admin_groups_path, notice: "Groupe créé avec succès!"
    else
      render :new
    end
  end

  def update
    if @group.update(group_params)
      redirect_to admin_groups_path, notice: "Groupe mise à jour avec succès!"
    else
      render :edit 
    end
  end

  def destroy
    @group.destroy
    redirect_to admin_groups_path, notice: "Groupe supprimé avec succès!"
  end
  
  private 
  def authenticate_admin! 
    unless current_user.admin?
      flash[:info] = "Vous n'avez pas les privilèges pour accéder à cette page."
      redirect_to root_path
    end
  end

  def group_params
    params.require(:group).permit(:name, :description, :user_id)
  end

  def set_group
    @group = Group.find(params[:id])
  end
  
end
