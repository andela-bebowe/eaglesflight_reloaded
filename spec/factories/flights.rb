FactoryGirl.define do
  factory :flight do
    destination_id 3
    departure_id 4
    departure_date "2015-10-27"
    price 3456
    id 1

    factory :nil_flight do
      departure_id = 1

    factory :flight2 do
      destination_id 2
      departure_id 1
      departure_date "2015-10-27"
      price 4567
      id 2
    end
  end
end
end
