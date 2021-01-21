class Admin::PaymentsController < ApplicationController
  before_action :set_payment, only: %i[show edit update destroy]
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def index
    @user = User.all 
    @payments = Payment.all.order('created_at DESC').page params[:page]
  end

  def new
    @payment = Payment.new
  end

  def edit
    @payment = Payment.find(params[:id])
  end

  def show 
    @payment = Payment.find(params[:id])
  end

  def create 
    @payment = Payment.new(payment_params)
    if @payment.save
      redirect_to admin_payments_path, notice: "Paiement enregistré avec succès!"
    else
      render :new
    end
  end

  def update
    if @payment.update(payment_params)
      redirect_to admin_payments_path, notice: "Paiement mise à jour avec succès!"
    else
      render :edit 
    end
  end

  def destroy
    @payment.destroy
    redirect_to admin_payments_path, notice: "Paiement supprimé avec succès!"
  end
  
  private 
  def authenticate_admin! 
    unless current_user.admin?
      flash[:info] = "Vous n'avez pas les privilèges pour accéder à cette page."
      redirect_to root_path
    end
  end
  
  def payment_params
    params.require(:payment).permit(:date_payment, :note, :pay_amount, :user_id)
  end

  def set_payment
    @payment = Payment.find(params[:id])
  end
end