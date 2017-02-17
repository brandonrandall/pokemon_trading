require 'spec_helper'

RSpec.feature "Admin can edit a reward" do
  describe "by opening the admin rewards index page" do
    scenario "and selecting the 'Edit' button, which takes them to the edit form" do
      admin = User.create(name: "admin", username: "admin 1", password:"password", role: 0)
      reward = Reward.create(name: "Super Potion", cost: 20)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_rewards_path

      # binding.pry

      within("#reward_super-potion") do
        click_on "Edit"
      end

      expect(current_path).to eq(edit_admin_reward_path(reward))
    end
  end
end