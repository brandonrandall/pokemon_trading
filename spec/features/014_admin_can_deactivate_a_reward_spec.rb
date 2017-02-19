require 'spec_helper'

RSpec.feature "Admin can deactivate a reward" do
  describe "by navigating to the admin reward page" do
    scenario "and selecting the 'Deactivate' button next to a reward" do
      admin = User.create(name: "admin", username: "admin 1", password:"password", role: 0)
      reward = Reward.create(name: "blue-flute", cost: 100)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_rewards_path

      within("#reward_blue-flute") do
        click_on "Deactivate"
      end

      expect(current_path).to eq(admin_rewards_path)
      within("#active_rewards") do
        expect(page).to_not have_css("#reward_blue-flute")
      end

      within("#inactive_rewards") do
        expect(page).to have_css("#reward_blue-flute")
      end

      within("#reward_blue-flute") do
        expect(page).to have_content("Blue Flute")
        expect(page).to have_content("100")
        expect(page).to have_button("Reactivate")
      end
    end
  end
end
