class PostCommentsController < ApplicationController
  
  def create
    goal = Goal.find(params[:goal_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.goal_id = goal.id
    comment.save
    redirect_to goals_path(goal)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
end
