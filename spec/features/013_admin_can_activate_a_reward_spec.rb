require 'spec_helper'

RSpec.feature "Admin can deactivate a reward" do
  describe "by navigating to the admin reward page" do
    scenario "and selecting the 'Deactivate' button next to a reward" do
      admin = User.create(name: "admin", username: "admin 1", password:"password", role: 0)
      reward = Reward.create(name: "red-flute", cost: 150, status: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_rewards_path

      within("#reward_red-flute") do
        click_on "Reactivate"
      end

      expect(current_path).to eq(admin_rewards_path)
      within("#inactive_rewards") do
        expect(page).to_not have_css("#reward_red-flute")
      end

      within("#active_rewards") do
        expect(page).to have_css("#reward_red-flute")
      end

      within("#reward_red-flute") do
        expect(page).to have_content("Red Flute")
        expect(page).to have_content("150")
        expect(page).to have_link("Deactivate")
      end
    end
  end
end
