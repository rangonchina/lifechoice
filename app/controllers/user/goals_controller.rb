class User::GoalsController < ApplicationController
 before_action :authenticate_user!, except: [:all_index]  
  def new
    @goal = Goal.new
    @theme_id = params[:theme_id]
    @theme = Theme.find_by(image_id: @theme_id)
  end
  
  def index
    @goals = Goal.where(user_id: current_user.id).order(created_at: :desc).page(params[:page]).per(9)
    if params[:theme_id].present?
        @goals = @goals.where(theme_id: params[:theme_id]) if params[:theme_id].present?
    end
  end
  
  def all_index
    @goals = Goal.order(created_at: :desc).page(params[:page]).per(9)
    # if params[:theme_id].present?
        @goals = @goals.where(theme_id: params[:theme_id]) if params[:theme_id].present?
    # end
  end
  
  def show
    @goal =  Goal.find(params[:id])  
    @post_comment = PostComment.new
    # @theme_id = params[:theme_id]
  end
  
  def edit
    @goal = Goal.find(params[:id])
  end
    
   #投稿データの保存
  def create
   params[:goal][:status] = params[:goal][:status].to_i
   @goal = Goal.new(goal_params)
   @goal.user_id = current_user.id
   @goal.save!
   redirect_to goals_path
  end
    
  def destroy
     @goal = Goal.find(params[:id])  # データ（レコード）を1件取得
     @goal.destroy  # データ（レコード）を削除
     redirect_to goals_path  # 投稿一覧画面へリダイレクト  
  end
    
  private
  # ストロングパラメータ
  def goal_params
    # params[:goal][:status] = params[:goal][:status].to_i
    params.require(:goal).permit(:title, :body, :status, :theme_id, :rate, :themes_id, :goals_id)
  end
end
