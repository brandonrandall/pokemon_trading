class RedeemReward < ApplicationRecord
  belongs_to :user
  belongs_to :reward

  def display_created_at
    self.created_at.strftime("%m-%d-%Y")
  end

  def self.total_points
    sum(:points)
  end
end
