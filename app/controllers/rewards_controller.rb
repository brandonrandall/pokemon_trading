class RewardsController < ApplicationController

  def index
    @rewards = Reward.where(status: 1).order(:cost, :name)
  end

  def show
    @redemptions = current_user.redeem_rewards
    @points_used = @redemptions.total_points
  end

end
