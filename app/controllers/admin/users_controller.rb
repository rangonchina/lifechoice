class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
     @user = User.new
     @users = User.all.page(params[:page]).per(15)
  end
  
  
end
