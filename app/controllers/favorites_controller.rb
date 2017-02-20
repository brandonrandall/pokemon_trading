class FavoritesController < ApplicationController

  def create
    @reward = Reward.find(params[:reward_id])
    @reward.reward_favorites.create(user_id: current_user.id)
    redirect_to rewards_path
  end

  def destroy
    @favorite = current_user.reward_favorites.find_by(reward_params)
    @favorite.destroy
    redirect_to rewards_path
  end

  private

  def reward_params
    params.permit(:reward_id)
  end
end
