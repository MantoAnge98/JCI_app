class Api::V1::GroupsController < ApplicationController  
  before_action :authenticate_user!, except: %i[index]  
  before_action :set_group, only: %i[index]

  def index
    @user = User.all
    @groups = Group.all
    render json: @groups 
  end

  private 
  def group_params
    params.permit(:name, :description, :user_id)
  end 
  def set_group
    @group = Group.find_by(params[:id])
  end


end
