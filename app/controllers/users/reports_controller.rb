class Users::ReportsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @reports = @user.reports.page(params[:page])
  end
end
