class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(
      :full_name, :location, :bio, 
      :gamertag, :twitter, :twitch, :psn, :email, :password, :password_confirmation, 
      :remember_me, :avatar,
      :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:full_name, :location, :email, :password, :password_confirmation, :profile_name, :favorite_books, :current_password) }
  end

end
