class Api::V1::HomeController < ApplicationController
  def index
    @user  = User.all
    render json: @user
  end
end
