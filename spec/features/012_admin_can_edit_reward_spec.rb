require 'spec_helper'

RSpec.feature "Admin can edit a reward" do
  describe "by opening the admin rewards index page" do
    scenario "and selecting the 'Edit' button, which takes them to the edit form" do
      admin = User.create(name: "admin", username: "admin 1", password:"password", role: 0)
      reward = Reward.create(name: "super-potion", cost: 20)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_rewards_path

      within("#reward_super-potion") do
        click_on "Edit"
      end

      expect(current_path).to eq(edit_admin_reward_path(reward))
    end
  end

  describe "in the edit form, the admin can change the..." do
    scenario "name value" do
      admin = User.create(name: "admin", username: "admin 1", password:"password", role: 0)
      reward = Reward.create(name: "super-potion", cost: 20)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit edit_admin_reward_path(reward)

      fill_in "reward[name]", with: "google-potion"
      click_on "Submit"

      expect(current_path).to eq(admin_rewards_path)
      within("#reward_google-potion") do
        expect(page).to have_content("Google Potion")
        expect(page).to have_content("20")
      end
    end

    scenario "cost value" do
      admin = User.create(name: "admin", username: "admin 1", password:"password", role: 0)
      reward = Reward.create(name: "super-potion", cost: 20)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit edit_admin_reward_path(reward)

      fill_in "reward[cost]", with: 200
      click_on "Submit"

      expect(current_path).to eq(admin_rewards_path)
      within("#reward_super-potion") do
        expect(page).to have_content("Super Potion")
        expect(page).to have_content("200")
      end
    end
  end
end