class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :signed_in?

  def current_user
    @user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def signed_in?
    current_user
  end
end
