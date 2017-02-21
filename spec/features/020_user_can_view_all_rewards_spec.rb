require 'spec_helper'

RSpec.feature "User can view all rewards." do
  describe "When the user visits the rewards index page," do
    it "they see a list of items they are able to redeem." do
      user = User.create(name: "user", username: "user 1", password:"password", role: 1)
      # add transaction here for 100 points
      reward_1 = Reward.create(name: "red-flute", cost: 50)
      reward_2 = Reward.create(name: "green-flute", cost: 75)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit rewards_path

      expect(page).to have_css("#reward_red-flute")
      expect(page).to have_css("#reward_green-flute")

      within("#reward_red-flute") do
        expect(page).to have_content("Red Flute")
        expect(page).to have_content("50")
        expect(page).to have_button("Redeem")
        expect(page).to have_content("Favorite")
      end

      within("#reward_green-flute") do
        expect(page).to have_content("Green Flute")
        expect(page).to have_content("75")
        expect(page).to have_button("Redeem")
        expect(page).to have_content("Favorite")
      end
    end

    xit "they see a list of items they are unable to redeem." do
      #### add this later

      user = User.create(name: "user", username: "user 1", password:"password", role: 1)
      # add transaction here for 100 points
      reward_1 = Reward.create(name: "yellow-flute", cost: 150)
      reward_2 = Reward.create(name: "black-flute", cost: 175)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit rewards_path

      expect(page).to have_css("#reward_yellow-flute")
      expect(page).to have_css("#reward_black-flute")

      within("#reward_yellow-flute") do
        expect(page).to have_content("Yellow Flute")
        expect(page).to have_content("50")
        expect(page).to have_content("Redeem")
        expect(page).to_not have_button("Redeem")
        expect(page).to have_content("Favorite")
      end

      within("#reward_black-flute") do
        expect(page).to have_content("Black Flute")
        expect(page).to have_content("75")
        expect(page).to have_content("Redeem")
        expect(page).to_not have_button("Redeem")
        expect(page).to have_content("Favorite")
      end
    end
  end
end