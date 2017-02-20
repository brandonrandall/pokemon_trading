require 'spec_helper'

RSpec.feature "Admin can view all rewards" do
  scenario "by navigating to the reward page" do
    admin = User.create(name: "admin", username: "admin 1", password:"password", role: 0)
    reward_1 = Reward.create(name: "dawn-stone", cost: 20)
    reward_2 = Reward.create(name: "moon-stone", cost: 30)
    reward_3 = Reward.create(name: "fire-stone", cost: 40)
    reward_4 = Reward.create(name: "leaf-stone", cost: 50)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_rewards_path

    within("#reward_dawn-stone") do
      expect(page).to have_content("Dawn Stone")
      expect(page).to have_content("20")
      expect(page).to have_link("Edit", href: edit_admin_reward_path(reward_1))
      expect(page).to have_link("Deactivate", href: admin_reward_path(reward_1))
    end
    within("#reward_moon-stone") do
      expect(page).to have_content("Moon Stone")
      expect(page).to have_content("30")
      expect(page).to have_link("Edit", href: edit_admin_reward_path(reward_2))
      expect(page).to have_link("Deactivate", href: admin_reward_path(reward_2))
    end
    within("#reward_fire-stone") do
      expect(page).to have_content("Fire Stone")
      expect(page).to have_content("40")
      expect(page).to have_link("Edit", href: edit_admin_reward_path(reward_3))
      expect(page).to have_link("Deactivate", href: admin_reward_path(reward_3))
    end
    within("#reward_leaf-stone") do
      expect(page).to have_content("Leaf Stone")
      expect(page).to have_content("50")
      expect(page).to have_link("Edit", href: edit_admin_reward_path(reward_4))
      expect(page).to have_link("Deactivate", href: admin_reward_path(reward_4))
    end
  end
end