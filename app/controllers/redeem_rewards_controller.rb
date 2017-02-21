class RedeemRewardsController < ApplicationController
  def create
    @redeem = RedeemReward.new(redeem_params)

    if @redeem.save
      @reward = Reward.find(redeem_params[:reward_id])
      flash[:success] = "You have successfully received #{@reward.display_name} "
      redirect_to rewards_path
    end
  end

  private

  def redeem_params
    params.require(:reward).permit(:reward_id, :user_id, :points)
  end
end
