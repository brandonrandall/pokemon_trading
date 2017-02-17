require 'spec_helper'

RSpec.feature "Admin can create a reward" do
  scenario "by navigating to the reward page" do
    admin = User.create(name: "admin", username: "admin 1", password:"password", role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_rewards_path

    click_on "Add New Reward"

    expect(current_path).to eq(new_admin_reward_path)
    expect(page).to_not have_content("The page you were looking for doesn't exist.")
  end

  describe "and selecting the category" do
    # describe "and navigating through the pagination" do
      scenario "and selecting a listed object" do
        admin = User.create(name: "admin", username: "admin 1", password:"password", role: 0)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit new_admin_reward_path

        select "healing", from: "item_list[category_name]"
        click_on "Filter"

        fill_in "rewards[berry-juice]", with: 10
        fill_in "rewards[fresh-water]", with: 20
        fill_in "rewards[soda-pop]", with: 10
        click_on "Create Rewards"

        expect(current_path).to eq(admin_rewards_path)
        within("#reward_berry-juice") do
          expect(page).to have_content("Berry Juice")
          expect(page).to have_content("10")
          expect(page).to have_link("Edit", href: edit_admin_reward_path(Reward.find_by(name: "berry-juice")))
        end
        within("#reward_fresh-water") do
          expect(page).to have_content("Fresh Water")
          expect(page).to have_content("20")
          expect(page).to have_link("Edit", href: edit_admin_reward_path(Reward.find_by(name: "fresh-water")))

        end
        within("#reward_soda-pop") do
          expect(page).to have_content("Soda Pop")
          expect(page).to have_content("10")
          expect(page).to have_link("Edit", href: edit_admin_reward_path(Reward.find_by(name: "soda-pop")))

        end
      end
    # end
  end

  scenario "and entering the name of the object" do
    admin = User.create(name: "admin", username: "admin 1", password:"password", role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_reward_path

    fill_in "item_list[item_name]", with: "max-potion"
    click_on "Filter"

    fill_in "rewards[max-potion]", with: 30
    click_on "Create Rewards"

    within("#reward_max-potion") do
      expect(page).to have_content("Potion")
      expect(page).to have_content("30")
    end
  end
end