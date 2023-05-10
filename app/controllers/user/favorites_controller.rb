class User::FavoritesController < ApplicationController
  
  def create
    goal = Goal.find(params[:goal_id])
    favorite = current_user.favorites.new(goal_id: goal.id)
    favorite.save
    redirect_to goal_path(goal)
  end

  def destroy
    goal = Goal.find(params[:goal_id])
    favorite = current_user.favorites.find_by(goal_id: goal.id)
    favorite.destroy
    redirect_to goal_path(goal)
  end
  
end
