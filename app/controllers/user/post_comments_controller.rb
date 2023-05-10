class User::PostCommentsController < ApplicationController
  
  def create
    goal = Goal.find(params[:goal_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.goal_id = goal.id
    comment.save
    redirect_to goal_path(goal)
  end
  
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to goal_path(params[:goal_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
end
