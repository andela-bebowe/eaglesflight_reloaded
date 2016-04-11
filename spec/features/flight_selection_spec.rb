require "rails_helper"

RSpec.feature "Flight Booking" do
  before :each do
    FactoryGirl.create(:airport3)
    FactoryGirl.create(:airport4)
    FactoryGirl.create(:flight)
    FactoryGirl.create(:airline)
    visit root_url
    select( "Krum", from: "Your take off point?" )
    select( "Shaggy", from: "Your destination?" )
    select( "October 27, 2015", from: "Your flight date?" )
    select( "2", from: "How many people" )
    click_button "SEARCH"
  end
  after :each do
    DatabaseCleaner.clean
  end
  scenario "when flight is not selected it should return to root_url" do
    click_button "Book chosen Flight"
    expect(page).to have_content("Pick a flight")
    expect(page.current_path).to eq "/"
  end
  scenario "Pick flight of choice from the table" do
    # save_and_open_page
    choose "flight_id_1"
    click_button "Book chosen Flight"
    expect(page.driver.status_code).to eq(200)
    expect(page.current_path).to eq "/bookings/new"
  end
end
