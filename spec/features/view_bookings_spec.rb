require "rails_helper"

RSpec.feature "Viewing past Bookings", type: :feature do
  before :all do
    DatabaseCleaner.clean
  end
  before :each do
    FactoryGirl.create(:booking_with_passengers)
    FactoryGirl.create(:flight)
    FactoryGirl.create(:airline)
    OmniAuth.config.test_mode = true
    facebook = OmniAuth.config.mock_auth[:facebook]
    Rails.application.env_config["omniauth.auth"] = facebook
    visit root_url
    click_link "Login"
    click_link "Sign in with Facebook"
  end
  after :each do
    DatabaseCleaner.clean
  end
  scenario "Logged in user wants to view past bookings" do
    visit mybooking_path
    expect(page).to  have_content "Passenger"
    expect(page).to  have_content "Cost"
    expect(page).to  have_content "Booking Id"
    expect(page).to  have_content "Ticket No"
    expect(page).to  have_content "Time"
    click_link "Log Out"
    # save_and_open_page
  end
  scenario "Logged in user wants to edit past booking" do
    visit findme_path
    expect(page).to  have_content "Booking Id"
    expect(page).to  have_content "Ticket No"
    fill_in "Booking Id", with: 1
    fill_in "Ticket No", with: 5001
    click_button "Find Booking"
    expect(page.driver.status_code).to eq(200)
    expect(page.current_path).to eq "/bookings/1/edit"
    expect(page).to have_content "Edit Booking"
    expect(page).to have_content "Name"
    fill_in "Name", with: "Blessing"
    fill_in "Email", with: "bobo@gmail.com"
    click_button "SUBMIT"
    expect(page.driver.status_code).to eq(200)
    expect(page.current_path).to eq "/bookings/1"
    expect(page).to have_content("Booking 1 successfully updated")
    expect(page).to have_content("Booking Details")
    expect(page).to have_content("Blessing")
    expect(page).to have_content("bobo@gmail.com")
    click_link "Log Out"
  end
  scenario "Logged in user wants to edit past booking with wrong ID" do
    visit findme_path
    expect(page).to  have_content "Booking Id"
    expect(page).to  have_content "Ticket No"
    fill_in "Booking Id", with: 15
    fill_in "Ticket No", with: 50023
    click_button "Find Booking"
    expect(page.current_path).to eq "/"
    expect(page).to have_content "This booking does not exist."
    click_link "Log Out"
  end
  scenario "Unregistered user tries to view bookings" do
    click_link "Log Out"
    expect(page).not_to  have_content "View Bookings"
    expect(page).not_to  have_content "Manage Bookings"
  end
end
