class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  has_many :redeem_rewards
  has_many :rewards, through: :redeem_rewards
  has_many :reward_favorites
  has_many :favorite_rewards, through: :reward_favorites

  enum role: [:admin, :user]
end
