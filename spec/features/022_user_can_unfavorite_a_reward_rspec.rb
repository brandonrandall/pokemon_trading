require 'spec_helper'

RSpec.feature "User can favorite a reward" do
  describe 'when user visits the rewards index page' do
    scenario "they can select the 'favorite' button for a reward they like" do
      user = User.create(name: "user", username: "user 1", password:"password", role: 1)
      reward_1 = Reward.create(name: "pink-flute", cost: 50)
      reward_2 = Reward.create(name: "purple-flute", cost: 75)
      RewardFavorite.create(user_id: user.id, reward_id: reward_1.id)
      RewardFavorite.create(user_id: user.id, reward_id: reward_2.id)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit rewards_path

      within("#reward_purple-flute") do
        click_on "Unfavorite"
      end

      within("#reward_pink-flute") do
        expect(page).to have_content "Unfavorite"
        expect(page).to_not have_content "Favorite"
      end

      within("#reward_purple-flute") do
        expect(page).to have_content "Favorite"
        expect(page).to_not have_content "Unfavorite"
      end
    end
  end
end