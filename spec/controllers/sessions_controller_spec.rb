require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  after :all do
    get :log_out
  end
  describe "#new" do
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
  describe "#create" do
    before :all do
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
    end
    it "should successfully create a user" do
      expect {
        post :create, provider: :facebook
      }.to change{ User.count }.by(1)
    end
    it "should successfully create a session" do
      expect(session[:user_id]).to be_nil
      post :create, provider: :facebook
      expect(session[:user_id]).not_to be_nil
    end
    it "should redirect the user to the root url" do
      post :create, provider: :facebook
      expect(response).to redirect_to root_url
    end
    it "should display a flash message" do
      post :create, provider: :facebook
      expect(flash[:success]).to eq "Welcome Blessing Ebowe, you are signed in!"
    end
  end
  describe "#destroy" do
    before :each do
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
    end
    it "should clear the session" do
      post :create, provider: :facebook
      expect(session[:user_id]).not_to be_nil
      delete :destroy
      expect(flash[:info]).to eq "Blessing Ebowe you are signed out!"
      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to root_url
    end
  end
end
