class PromotionController < ApplicationController
  before_action :authenticate_user!, except: %i[index]  
  before_action :set_promotion, only: %i[index]

  def index
    @user = User.all
    @promotions = Promotion.all 
  end

  private 
  def promotion_params
    params.permit(:name, :description, :user_id)
  end 
  def set_promotion
    @group = Group.find_by(params[:id])
  end
end