class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: session_params[:username])
    if user && user.authenticate(session_params[:password])
      log_in(user)
      redirect_to user_path(user)
    else
      #flash errors
      redirect_to login_path
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end