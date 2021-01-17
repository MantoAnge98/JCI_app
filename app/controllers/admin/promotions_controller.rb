class Admin::PromotionsController < ApplicationController
  before_action :admin_check
  before_action :set_group, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

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
      redirect_to admin_groups_path, notice: "Group saved!"
    else
      render :new
    end
  end

  def update
    if @group.update(group_params)
      redirect_to admin_groups_path, notice: "Group updated!"
    else
      render :edit 
    end
  end

  def destroy
    @group.destroy
    redirect_to admin_groups_path, notice: "Group deleted!"
  end
  
  private
  def admin_check
    unless current_user.admin?
      redirect_to root_path, notice: "Only Admin can Logged"
    end
  end

  def group_params
    params.permit(:name, :description, :user_id)
  end

  def set_group
    @group = Group.find(params[:id])
  end
  
end
