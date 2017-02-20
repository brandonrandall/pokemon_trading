class RewardsController < ApplicationController
  def index
    @rewards = Reward.where(status: 1).order(:cost, :name)
  end

end
