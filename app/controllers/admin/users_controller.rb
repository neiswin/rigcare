
class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  before_action :set_user!, only: %i[destroy edit update]
  # before_action :authorize_user!
  # after_action :verify_authorized

  def create
  end

  def destroy
    @user.destroy
    flash[:success] = 'User deleted!'
    redirect_to admin_users_path
  end

  def edit 
  end

  def index
    @users = User.all
  end

  def update
    
    if @user.update user_params
      flash[:success] = 'User updated!'
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  private


  def set_user!
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :email, :password, :password_confirmation, :role)
  end

  def authorize_user!
    authorize_user!(@user || User) 
  end

  def require_admin
    unless current_user&.admin_role?
      flash[:alert] = 'Доступ запрещен. Эта страница доступна только администраторам.'
      redirect_to root_path
    end
  end
end








