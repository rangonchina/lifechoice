class SearchesController < ApplicationController
   before_action :authenticate_user!
  def search
    @range = params[:range]
    if @range == "User"
      @users = User.themes(params[:search], params[:word])
    else
      @theme = User.looks(params[:search], params[:word])
    end
  end
  
end
