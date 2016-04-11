FactoryGirl.define do
  factory :airline do
    name "Boeing"
    factory :invalid_airline do
      name nil
    end
  end
end
