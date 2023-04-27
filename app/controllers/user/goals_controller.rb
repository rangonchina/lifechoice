class User::GoalsController < ApplicationController
    
  def new
    @goal = Goal.new
    @theme_id = params[:theme_id]
  end
  
  def index 
    @goal = Goal.all  
  end
  
  def show
    @goal =  Goal.find(params[:id])  
  
      
  end
  
  def edit
    @goal = Goal.find(params[:id])
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
    params[:goal][:status] = params[:goal][:status].to_i
    params.require(:goal).permit(:title, :body, :status, :theme_id)
  end
    
    
    
end
