require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "get request to sessions controller new action" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "post request to sessions controller " do
    it "Not to be success for empty post" do
      post :create
      expect(response).not_to have_http_status(:success)
    end

    it "renders new for failed creation" do
      post :create
      expect(response).to render("new")
    end
  end
end
