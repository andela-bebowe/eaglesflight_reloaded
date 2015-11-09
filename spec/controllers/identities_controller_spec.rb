require 'rails_helper'

RSpec.describe IdentitiesController, type: :controller do
  describe "get request to identity controller " do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end
end
