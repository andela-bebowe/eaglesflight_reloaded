require "rails_helper"

RSpec.feature "Flight search" do
  before :all do
    FactoryGirl.create(:airport)
    FactoryGirl.create(:airport2)
    FactoryGirl.create(:flight2)
  end
  scenario "select boxes for destination and departure" do
    visit root_path
    expect(page).to have_selector("#flight_departure_id"),
    with_options: ["Konga"]
    expect(page).to have_selector("#flight_destination_id"),
    with_options: ["Konga"]
  end
  scenario "select boxes for flight date, and number of people" do
    visit root_path
    expect(page).to have_selector("#flight_departure_date"),
    with_options: ["November 27, 2015"]
    expect(page).to have_selector("#flight_booking_no_of_passengers"),
    with_options: ["1"]
  end
  scenario "select choice options for search and finds flight" do
    visit root_path
    select("Kwasi", from: "Your take off point?" )
    select("Kasti", from: "Your destination?" )
    select("October 27, 2015", from: "Your flight date?" )
    select("1", from: "How many people" )
    click_button "SEARCH"
    expect(page).to have_content("Make a choice of Flight")
    expect(page).to have_content("Airlines")
    expect(page).to have_content("Price")
    expect(page).to have_content("Price for 1")
  end
  scenario "selects unavailable flight" do
    visit root_path
    select("Kwasi", from: "Your take off point?" )
    select("Kwasi", from: "Your destination?" )
    select("October 27, 2015", from: "Your flight date?" )
    select("2", from: "How many people" )
    click_button "SEARCH"
    expect(page).to have_content("No Flights in this category")
  end
  scenario "user wants to view all flights" do
    visit root_path
    click_link "ALL FLIGHTS"
    expect(page).to have_content("All Flights")
    expect(page.driver.status_code).to eq(200)
    expect(page.current_path).to eq "/all_flights"
  end
end
