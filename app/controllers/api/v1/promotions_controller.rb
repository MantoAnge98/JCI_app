class Api::V1::PromotionsController < ApplicationController
  before_action :authenticate_user!, except: %i[index]  
  before_action :set_promotion, only: %i[index]

  def index
    @user = User.all
    @promotions = Promotion.all 
    render json: @promotions
  end

  private 
  def promotion_params
    params.permit(:name, :description, :year_promotion, :image_promotion, :user_id)
  end 
  def set_promotion
    @promotion = Promotion.find_by(params[:id])
  end
end
