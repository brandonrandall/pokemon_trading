require 'spec_helper'

RSpec.feature "User can view a list of their pinkeemed rewards." do
  describe "When user visits their rewards page," do
    scenario "they can see a list of the rewards they have redeemed." do
      user = User.create(name: "user", username: "user 1", password:"password", role: 1)
      reward_1 = Reward.create(name: "pink-flute", cost: 50)
      reward_2 = Reward.create(name: "purple-flute", cost: 75)
      RedeemReward.create(user_id: user.id, reward_id: reward_1.id, points: 50)
      RedeemReward.create(user_id: user.id, reward_id: reward_2.id, points: 75)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit reward_path(user)

      expect(page).to have_css("#reward_pink-flute")
      expect(page).to have_css("#reward_purple-flute")

      within("#reward_pink-flute") do
        expect(page).to have_content("Pink Flute")
        expect(page).to have_content("50")
        expect(page).to have_content(Time.now.gmtime.strftime("%m-%d-%Y"))
      end

      within("#reward_purple-flute") do
        expect(page).to have_content("Purple Flute")
        expect(page).to have_content("75")
        expect(page).to have_content(Time.now.gmtime.strftime("%m-%d-%Y"))
      end
    end
  end
end