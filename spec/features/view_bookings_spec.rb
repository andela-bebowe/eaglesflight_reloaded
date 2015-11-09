require "rails_helper"

RSpec.feature "Viewing past Bookings" do
  before :each do
    FactoryGirl.create(:booking_with_passengers)
    FactoryGirl.create(:flight)
    FactoryGirl.create(:plane)
    FactoryGirl.create(:airline)
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:facebook, {:uid => "123456"})
    visit root_path
    click_link "Login"
    click_link "Sign in with Facebook"
  end
  scenario "Logged in user wants to view past bookings" do
    visit mybooking_path
    expect(page).to  have_content ("Passenger")
    expect(page).to  have_content ("Cost")
    expect(page).to  have_content ("Booking Id")
    expect(page).to  have_content ("Ticket No")
    expect(page).to  have_content ("Time")
  end
  scenario "Logged in user wants to edit past booking" do
    visit findme_path
    expect(page).to  have_content ("Booking Id")
    expect(page).to  have_content ("Ticket No")
    fill_in "Booking Id", with: 1
    fill_in "Ticket No", with: 5002
    click_button "Find Booking"
    expect(page.driver.status_code).to eq(200)
    expect(page.current_path).to eq "/bookings/1/edit"
    expect(page).to have_content("Edit Booking")
    save_and_open_page
    expect(page).to have_content("Name")
    fill_in "Name", with: "Blessing"
    fill_in "Email", with: "bobo@gmail.com"
    save_and_open_page
    # click_button "SUBMIT"
    # expect(page.driver.status_code).to eq(200)
    # expect(page.current_path).to eq "/bookings/1"
    # expect(page).to have_content("Booking 1 successfully updated")
    # expect(page).to have_content("Booking details")
    # expect(page).to have_content("Blessing")
    # expect(page).to have_content("Bobo@gmail.com")
  end
end
