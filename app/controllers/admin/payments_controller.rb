class Admin::PaymentsController < ApplicationController
  before_action :set_payment, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index 
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
    @user = User.find(params[:user_id])
    @payment = Payment.new(payment_params)
    if @payment.save
      redirect_to admin_payments_path, notice: "Payment saved!"
    else
      render :new
    end
  end

  def update
    if @payment.update(payment_params)
      redirect_to admin_payments_path, notice: "Payment updated!"
    else
      render :edit 
    end
  end

  def destroy
    @payment.destroy
    redirect_to admin_payments_path, notice: "Payment deleted!"
  end
  
  private
  def payment_params
    params.permit(:date_payment, :note, :pay_amount, :user_id)
  end

  def set_payment
    @payment = Payment.find(params[:id])
  end
end