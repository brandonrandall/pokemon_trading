class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    if @current_user
      @current_user
    elsif session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      nil
    end
  end

  def current_admin?
    current_user && current_user.admin?
  end

end
