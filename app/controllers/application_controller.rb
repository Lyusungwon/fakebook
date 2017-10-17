class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up){ |u| u.permit(:email, :password, :password_confirmation, :lastname, :firstname, :gender) }
    devise_parameter_sanitizer.for(:account_update){ |u| u.permit(:email, :password, :password_confirmation, :lastname, :firstname, :gender, :profile_image, :cover_image, :current_password) }
  end
end