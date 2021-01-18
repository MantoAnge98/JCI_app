class Api::V1::HomeController < ApplicationController
  def index
    @user  = User.all
  end
end
