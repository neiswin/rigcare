class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id]).decorate
    @faqs = @user.faqs 
  end
end