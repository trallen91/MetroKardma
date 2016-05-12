class UsersController < ApplicationController
  respond_to :json

  def show
    @user = User.find_by(id: params[:id])
    render :json => @user.to_json(:only => [:first_name, :last_name, :id], :methods => [:average_rating, :kardma_count])
  end

  def index
    @users = User.all
    render :json => @users.to_json(:only => [:first_name, :last_name, :id])
  end
end