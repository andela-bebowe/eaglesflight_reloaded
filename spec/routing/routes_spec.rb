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

  it "routes to Sessions controller new action for login form" do
    expect(:get => "login").to route_to(
      :controller => "sessions",
      :action => "new"
    )
  end

  it "route to Sessions controller post action for user login" do
    expect(:get => "login").to route_to(
      :controller => "sessions",
      :action => "new"
    )
  end

  it "routes logout to Sessions controller delete action" do
    expect(:get => "logout").to route_to(
      :controller => "sessions",
      :action => "delete"
    )
  end
end
