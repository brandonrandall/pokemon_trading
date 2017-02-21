class AddPointsToRedeemRewardsTable < ActiveRecord::Migration[5.0]
  def change
    add_column :redeem_rewards, :points, :integer
  end
end
