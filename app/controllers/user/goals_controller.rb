class User::GoalsController < ApplicationController
    
  def new
    @goal = Goal.new 
  end
    
  # 投稿データの保存
  #def create
   # @goal = Goal.new(goal_params)
   # @goal.user_id = current_user.id
    #@goal.save
    #redirect_to エイダイレクト先_path
  #end
    
end
