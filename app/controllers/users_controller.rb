class UsersController < ApplicationController
  respond_to :json

  def show
    @user = User.find_by(id: params[:id])
    render :json => @user.to_json(:methods => :average_rating)
  end

  def index
    @users = User.all
    render :json => @users.to_json(:only => [:first_name, :last_name, :id])
  end

end