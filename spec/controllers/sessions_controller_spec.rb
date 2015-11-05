# require 'rails_helper'
#
# RSpec.describe SessionsController, type: :controller do
#   describe "get request to sessions controller new action" do
#     it "returns http success" do
#       get :new
#       expect(response).to have_http_status(:success)
#     end
#
#     it "renders the new template" do
#       get :new
#       expect(response).to render_template("new")
#     end
#   end
#
#   describe "post request to sessions controller " do
#     it "Not to be success for empty post" do
#       post :create
#       expect(response).not_to have_http_status(:success)
#     end
#
#     it "renders new for failed creation" do
#       post :create
#       expect(response).to render("new")
#     end
#   end
# end
#
#
#   describe "#create" do
#
#     it "should successfully create a user" do
#       expect {
#         post :create, provider: :github
#       }.to change{ User.count }.by(1)
#     end
#
#     it "should successfully create a session" do
#       session[:user_id].should be_nil
#       post :create, provider: :github
#       session[:user_id].should_not be_nil
#     end
#
#     it "should redirect the user to the root url" do
#       post :create, provider: :github
#       response.should redirect_to root_url
#     end
#
#   end
#
#   describe "#destroy" do
#     before do
#       post :create, provider: :github
#     end
#
#     it "should clear the session" do
#       session[:user_id].should_not be_nil
#       delete :destroy
#       session[:user_id].should be_nil
#     end
#
#     it "should redirect to the home page" do
#       delete :destroy
#       response.should redirect_to root_url
#     end
#   end
