RSpec.feature "User registration, login and logout", :type => :feature do
  user = FactoryGirl.new(:user)

  scenario "User fills registration form" do
    visit "/signup"
    fill_in "Name", :with => "John"
    fill_in "Email", :with => "something@gmail.com"
    fill_in "Password", :with => "gonow"
    fill_in "Confirm Password", :with => "gonow"

    click_button "Sign Up"

    expect(page).to have_content("Welcome to Eagles Flight")
  end

  scenario "User logs in" do
    visit "/login"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password

    click_button "Log In"

    expect(page).to have_text("Log In Successful")
  end

  scenario "User logs out" do
    visit "/logout"
    click_link "Log Out"
    expect(page).content_for(:title) { "Home | Eagles Flight" }
  end

  scenario "Unregistered user tries to log in" do
    visit "/login"
    fill_in "Email", :with => "baba"
    fill_in "Password", :with => "mama"
    click_button "Log In"
    expect(page).to have_text("Invalid Credentials.")
  end
end
