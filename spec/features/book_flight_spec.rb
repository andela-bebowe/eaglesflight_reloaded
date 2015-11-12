require "rails_helper"

RSpec.feature "Flight Booking" do
  before :each do
    FactoryGirl.create(:airport3)
    FactoryGirl.create(:airport4)
    FactoryGirl.create(:flight)
    FactoryGirl.create(:airline)
    visit root_url
    select("Krum", from: "Your take off point?" )
    select("Shaggy", from: "Your destination?" )
    select("October 27, 2015", from: "Your flight date?" )
    select("1", from: "How many people" )
    click_button "SEARCH"
    # save_and_open_page
    choose "flight_id_1"
    click_button "Book chosen Flight"
    user = FactoryGirl.create(:user)
    fill_in "Name", with: (user.name)
    fill_in "Email", with: (user.email)
  end
  after :each do
    DatabaseCleaner.clean
  end
  scenario "Fill in correct passenger details and Submit" do
    click_button "SUBMIT"
    expect(page.driver.status_code).to eq(200)
    expect(page).to have_content("You just got yourself a free booking")
    expect(page.current_path).to eq "/bookings/1"
  end
  scenario "Select paid option of booking" do
    check "booking_paid_booking"
    click_button "SUBMIT"
    expect(page.driver.status_code).to eq(200)
    expect(page.current_path).to eq "/bookings"
    expect(page).to have_content("Pay with Paypal")
  end
end
