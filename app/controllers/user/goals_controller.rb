class User::GoalsController < ApplicationController
    
  def new
    @goal = Goal.new 
  end
  
  def show
    @goal =  Goal.find(params[:id])  
      
  end
    
   #投稿データの保存
  def create
   @goal = Goal.new(goal_params)
   @goal.user_id = current_user.id
   @goal.save
   redirect_to goal_path(@goal.id)
  end
    
  private
  # ストロングパラメータ
  def goal_params
    params.require(:goal).permit(:title, :body, :theme_id)
  end
    
    
    
end
