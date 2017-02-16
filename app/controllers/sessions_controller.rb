class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(current_user)
    else
      ## use flash[:alert] to notify their login credentials are wrong
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    ## use flash[:alert] to notify user they've logged out successfully
    redirect_to root_path
  end

end
