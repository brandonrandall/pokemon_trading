class Reward < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :cost, presence: true
  has_many :redeem_rewards
  has_many :redemptions, through: :redeem_rewards
  has_many :reward_favorites
  has_many :favorited_by_users, through: :reward_favorites, source: :user

  enum status: ["inactive", "active"]

  def display_name
    self.name.split("-").map { |word| word.capitalize }.join(" ")
  end
end
