FactoryGirl.define do
  factory :plane do
    name "Hacky"
    id 1
    flight_id 1
    airline_id 1

    factory :plane2 do
      id 2
      flight_id 1
      airline_id 1
    end
  end
end
