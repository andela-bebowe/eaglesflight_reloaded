require "rails_helper"
RSpec.describe "routing to controllers", :type => :routing do
  it "routes root path to flights controller and index action" do
    expect(:get => "/").to route_to(
      :controller => "flights",
      :action => "index"
    )
  end
  it "routes login to Sessions new action" do
    expect(:get => "login").to route_to(
      :controller => "sessions",
      :action => "new"
    )
  end
  it "does not expose a list of bookings" do
      expect(:get => "/bookings").not_to be_routable
  end
  it "routes /failure to sessions#failure" do
    expect(:get => "/failure").to route_to(
      :controller => "sessions",
      :action => "failure"
    )
  end
  it "routes /bookings/:id to bookings#show" do
    expect(:get => "/bookings/2").to route_to(
      :controller => "bookings",
      :action => "show",
      :id => "2"
    )
  end
  it "routes all_flights path to flights#all_flights" do
    expect(:get => "/all_flights").to route_to(
      :controller => "flights",
      :action => "all_flights"
    )
  end
  it "does not give access to identities#create" do
    expect(:get => "/identities").not_to be_routable
  end
  it "routes logout to Sessions controller delete action" do
    expect(:get => "logout").to route_to(
      :controller => "sessions",
      :action => "destroy"
    )
  end
end
