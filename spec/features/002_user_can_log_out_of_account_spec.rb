require 'rails_helper'

RSpec.feature "User can log out of their account" do
  describe "when user visits the home page" do
    it "they click the 'log out' button" do
      user = User.create(name: "Brandon", username: "B1", password: "password")
      visit login_path
      fill_in "session[username]", with: user.username
      fill_in "session[password]", with: user.password
      click_on "Log In"

      visit root_path

      click_on "Log Out"

      # expect(page).to have_content("You have successfully logged out.")
      expect(page).to have_content("Log In")
    end
  end
end
