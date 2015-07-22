class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id].present?
  end

  def require_login
    unless current_user
      flash[:danger] = "You must sign in"
      redirect_to sign_in_path
    end
  end

end
