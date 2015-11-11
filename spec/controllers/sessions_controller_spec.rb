require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  describe "get request to sessions controller new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end
  describe "Failure in sessions controller" do
    it "renders the new template" do
      get :failure
      expect(response).to render_template("new")
      expect(flash[:warning]).to eq("Authentication failed, Try again")
    end
  end
end
