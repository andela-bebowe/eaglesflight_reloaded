FactoryGirl.define do
  factory :identity do
    name "Blessing Ebowe"
    email "blessingebowe@gmail.com"
    password_digest "password"
    factory :invalid_identity do
      name nil
      email nil
    end
    factory :invalid_email do
      email "ghhkl"
    end
  end
end
