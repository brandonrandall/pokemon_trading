require 'spec_helper'

RSpec.feature 'user can create an account' do
  describe 'when user visits the home page'do
    it 'they can enter info and create a user account' do
      # region = Region.create(name: "East")

      visit root_path

      click_on "Sign Up"

      expect(current_path).to eq(new_user_path)

      fill_in "user[name]", with: "Brandon"
      fill_in "user[username]", with: "B1"
      fill_in "user[password]", with: "password"
      # select region.title, from: "user[region]"
      click_on "Create Account"

      expect(current_path).to eq(user_path(User.last.id))
      expect(page).to have_content("Brandon")
      expect(page).to have_content("B1")
      # expect(page).to have_content("East")
      expect(User.count).to eq(1)
    end
  end

  context "they enter an invalid form" do
    ## put tests here!
  end
end
