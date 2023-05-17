class Admin::UsersController < ApplicationController
  
  def index
     @user = User.new
     @users = User.all
  end
  
  
end
