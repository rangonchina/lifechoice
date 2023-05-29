class Admin::GoalsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
   @goals = Goal.where(theme_id: params[:theme_id]).page(params[:page]).per(12)
  end
  
  def show
      @goal = Goal.find(params[:id])
      pp '------------------------'
      pp @goal.post_comments
  end
  
end
