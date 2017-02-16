require 'rails_helper'

RSpec.feature "User can log into their account" do
  describe "when user visits the home page" do
    it "they can enter their account info and log in" do
      user = User.create(name: "Ashley", username: "A1", password: "password")

      visit root_path
      click_on "Log In"

      expect(current_path).to eq(login_path)
      fill_in "session[username]", with: user.username
      fill_in "session[password]", with: user.password
      click_on "Log In"

      expect(current_path).to eq(user_path(user.id))
    end
  end

  context "user enters in invalid credentials" do
    it "user enters in wrong username" do
      # put test here!
    end

    it "user enters in wrong password" do
      # put test here!
    end
  end
end
