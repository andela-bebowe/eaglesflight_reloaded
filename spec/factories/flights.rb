FactoryGirl.define do
  factory :flight do
    destination_id 2
    departure_id 1
    departure_date "2015-10-27"
    price 3456

    factory :nil_flight do
      departure_id = 1
    end
  end

end
