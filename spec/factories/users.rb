FactoryGirl.define do
  factory :user do
    name "Blessing Ebowe"
    email "blessingebowe@gmail.com"
    profile_img "http://graph.facebook.com/1065771400114300/picture"
    provider "identity"
    uid "1065771400114300"
    password "blessing"
  end
end
