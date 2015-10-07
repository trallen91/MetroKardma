class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to user_path(@user)
    else
      #flash errors here
      redirect_to register_path
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :picture)
  end
end