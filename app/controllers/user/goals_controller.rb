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
       @theme = Theme.find(params[:theme_id])
       @goals = @goals.where(theme_id: params[:theme_id]) if params[:theme_id].present?
    end
    @p_index = true
  end
  
  def lifebox
    @user = User.find(params[:user_id])
    @goals = Goal.where(user_id: @user.id).order(created_at: :desc).page(params[:page]).per(9)
    @p_index = true
  end
  
  def all_index
    @goals = Goal.order(created_at: :desc).page(params[:page]).per(9)
    # if params[:theme_id].present?
    @goals = @goals.where(theme_id: params[:theme_id]) if params[:theme_id].present?
    @goals = @goals.where(rate: params[:rate]) if params[:rate].present?
    @goals = Goal.looks(params[:word]).page(params[:page]).per(9) if params[:word].present?
    if params[:theme_id].present?
       @theme = Theme.find(params[:theme_id])
       @goals = @goals.where(theme_id: params[:theme_id]) if params[:theme_id].present?
       if params[:rate].present? 
          @rate = params[:rate]
       end
    end
    @p_index = false
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
  
  def rate
      @goals = Goal.order(created_at: :desc).page(params[:page]).per(9)
      @goals = @goals.where(rate: params[:rate]) 
      render :all_index
  end
    
  private
  # ストロングパラメータ
  def goal_params
    # params[:goal][:status] = params[:goal][:status].to_i
    params.require(:goal).permit(:title, :body, :status, :theme_id, :rate, :themes_id, :goals_id)
  end
end
