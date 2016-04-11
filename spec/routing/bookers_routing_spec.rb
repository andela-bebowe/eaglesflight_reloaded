require "rails_helper"

RSpec.describe BookersController, type: :routing do
  describe "routing" do
    it "routes to #new" do
      expect(get: "/bookers/new").to route_to("bookers#new")
    end

    it "routes to #create" do
      expect(post: "/bookers").to route_to("bookers#create")
    end
  end
end
