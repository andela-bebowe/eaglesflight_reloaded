require "rails_helper"
RSpec.feature "User authetication" do
  feature "User login and logout with facebook", :type => :feature do
    before do
      OmniAuth.config.mock_auth[:facebook]
    end
    after :each do
      DatabaseCleaner.clean
    end
    scenario "with facebook" do
      visit root_url
      click_link "Login"
      click_link "Sign in with Facebook"
      expect(page).to have_content "Welcome Blessing Ebowe, you are signed in!"
      find("#mybooking").click
      click_link "Log Out"
      expect(page).to have_content "Blessing Ebowe you are signed out!"
    end
    scenario "correct login with identity oauth" do
      sign_up_with "eaglesflight@gmail.com", "password"
      expect(page).to have_content("Welcome Example User, you are signed in!")
      find("#mybooking").click
      click_link "Log Out"
      expect(page).to have_content "Example User you are signed out!"
    end
  end
  feature "User login and logout with identity", :type => :feature do
    before do
      OmniAuth.config.test_mode = false
    end
    scenario "with invalid email" do
      sign_up_with "invalidemail", "password"
      expect(page).to have_content("Sign In")
    end
    scenario "with blank password" do
      sign_up_with "eaglesflight@gmail.com", ""
      expect(page).to have_content("Sign In")
    end
  end
  def sign_up_with(email, password)
    visit root_url
    click_link "Login"
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Login"
  end
end
