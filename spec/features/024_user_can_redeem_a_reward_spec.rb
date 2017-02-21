require 'spec_helper'

RSpec.feature "User can redeem a reward." do
  describe "When the user visits the rewards index page," do
    describe "they see a list of items they are able to redeem," do
      it "they select an item to redeem." do
        user = User.create(name: "user", username: "user 1", password:"password", role: 1)
        # add transaction here for 100 points
        reward_1 = Reward.create(name: "orange-flute", cost: 50)
        reward_2 = Reward.create(name: "violet-flute", cost: 75)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit rewards_path

        within("#reward_orange-flute") do
          click_button("Redeem")
        end

        visit reward_path(user)

        expect(page).to have_content("Total Points Redeemed: 50")
        within(".reward_box") do
          expect(page).to have_content("Orange Flute")
          expect(page).to have_content("50")
          expect(page).to have_content(Time.now.gmtime.strftime("%m-%d-%Y"))
        end
      end
    end
  end
end