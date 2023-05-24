class Admin::GoalsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
   @goals = Goal.where(theme_id: params[:theme_id])
  # @goals = @theme.goals
   #render '/user/goals/goals_index'
#   @post_comments = PostComment.where(goal_id: params[:theme])
  end
  
  def show
      @goal = Goal.find(params[:id])
      pp '------------------------'
      pp @goal.post_comments
  end
  
end
