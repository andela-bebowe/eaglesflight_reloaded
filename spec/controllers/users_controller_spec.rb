require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "show request to user controller " do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end

    it "renders the new template" do
      get :show
      expect(response).to render_template("show")
    end
  end
end
