FactoryGirl.define do
  factory :user do
    name "Blessing Ebowe"
    email "blessingebowe@gmail.com"
    profile_img "http://graph.facebook.com/1065771400114300/picture"
    provider "facebook"
    uid "1065771400114300"
  end
end
