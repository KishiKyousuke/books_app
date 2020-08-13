class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find_by(id: params[:id])
  end

  def index
    @users = User.all
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end
end
