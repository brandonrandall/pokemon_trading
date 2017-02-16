class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])

    if @user && @user.authenticate(params[:session][:password])
      redirect_to user_path(@user.id)
    else
      ## use flash[:alert] to notify their login credentials are wrong
      redirect_to login_path
    end
  end

end
