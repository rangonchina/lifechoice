class Admin::PostCommentsController < ApplicationController
   
   def destroy
     @post_comment = PostComment.find(params[:id])  # データ（レコード）を1件取得
     @post_comment.destroy  # データ（レコード）を削除
    redirect_to admin_goal_path(params[:goal_id])
   end
   
end
