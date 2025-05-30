class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  skip_before_action :verify_authenticity_token, if: :devise_controller?

  # skip_before_action :verify_authenticity_token
  # before_action :authenticate_user! 

 
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar, :first_name, :last_name, :phone, :email, :department, :position])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :first_name, :last_name, :phone, :email, :department, :position, :password, :password_confirmation])
  end
end
