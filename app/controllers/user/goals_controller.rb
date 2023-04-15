class User::GoalsController < ApplicationController
    
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @goal = goal.all 
  end
    
end
