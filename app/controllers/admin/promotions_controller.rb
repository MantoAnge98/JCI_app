class Admin::PromotionsController < ApplicationController
  before_action :set_promotion, only: %i[show edit update destroy]
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def index
    @user = User.all
    @promotions = Promotion.all.order('created_at DESC').page params[:page]
  end

  def new
    @promotion = Promotion.new
  end

  def edit
    @promotion = Promotion.find(params[:id])
  end
  

  def show 
    @promotion = Promotion.find(params[:id])
  end
  

  def create
    @promotion = Promotion.new(promotion_params)
    if @promotion.save
      redirect_to admin_promotions_path, notice: "Promotion enregistrée avec succès!"
    else
      render :new
    end
  end

  def update
    if @promotion.update(promotion_params)
      redirect_to admin_promotions_path, notice: "Promotion mise à jour avec succès!"
    else
      render :edit 
    end
  end

  def destroy
    @promotion.destroy
    redirect_to admin_promotions_path, notice: "Promotion supprimée avec succès!"
  end
  
  private 
  def authenticate_admin! 
    unless current_user.admin?
      flash[:info] = "Vous n'avez pas les privilèges pour accéder à cette page."
      redirect_to root_path
    end
  end

  def promotion_params
    params.require(:promotion).permit(:name, :description, :year_promotion, :image_promotion, :image_promotion_cache, :user_id)
  end

  def set_promotion
    @promotion = Promotion.find(params[:id])
  end
  
end
