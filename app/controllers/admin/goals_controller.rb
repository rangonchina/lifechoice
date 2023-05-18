class Admin::GoalsController < ApplicationController
  
  def index
   @theme = Theme.find(params[:theme])
   @goals = @theme.goals
#   @post_comments = PostComment.where(goal_id: params[:theme])
  end
  
    
   #投稿データの保存
  def create
   @goal = Goal.new(goal_params)
   @goal.user_id = current_user.id
   @goal.save
   redirect_to goals_path(@goal.id)
  end
    
  def destroy
     @goal = Goal.find(params[:id])  # データ（レコード）を1件取得
     @goal.destroy  # データ（レコード）を削除
     redirect_to goals_path  # 投稿一覧画面へリダイレクト  
  end
    
  private
  # ストロングパラメータ
  def goal_params
    params[:goal][:status] = params[:goal][:status].to_i
    params.require(:goal).permit(:title, :body, :status, :theme_id)
  end
  
end
