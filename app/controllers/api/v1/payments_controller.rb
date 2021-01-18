class Api::V1::PaymentsController < ApplicationController  
  before_action :authenticate_user!  
  before_action :set_payment, only: %i[index]

  def index 
    @user = User.all
    @payments = Payment.all.order('created_at DESC').page params[:page]
    render json: @payments
  end 

  private
  def payment_params
    params.permit(:date_payment, :note, :pay_amount, :user_id)
  end
  def set_payment
    @payment = Payment.find_by(params[:id])
  end

end
