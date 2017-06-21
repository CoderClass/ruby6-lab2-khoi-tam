class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :signed_in?

  def current_user
    @user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def signed_in?
    current_user
  end
  
  def require_login
    redirect_to login_path, :flash => { :error => "Insufficient rights!" } unless signed_in?
  end
   
  def skip_if_logged_in
    redirect_to users_path if signed_in?
  end
end
