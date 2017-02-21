require 'spec_helper'

RSpec.feature "User cannot access admin pages" do
  scenario "User tries to access the admin/rewards page" do
    user = User.create(name: "user", username: "user 1", password:"password", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_rewards_path

    expect(page).to have_content("The page you were looking for doesn't exist.")
    expect(page).to_not have_content("Rewards")
  end

  scenario "User tries to access the admin/rewards/new page" do
    user = User.create(name: "user", username: "user 1", password:"password", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_admin_reward_path

    expect(page).to have_content("The page you were looking for doesn't exist.")
    expect(page).to_not have_content("Create New Rewards")
  end

  scenario "User tries to access the admin/rewards/edit page" do
    user = User.create(name: "user", username: "user 1", password:"password", role: 1)
    reward = Reward.create(name: "Potion", cost: 20)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit edit_admin_reward_path(reward)

    expect(page).to have_content("The page you were looking for doesn't exist.")
    expect(page).to_not have_content("Edit Reward")
  end
end