FactoryGirl.define do
  factory :booking do
    ticket_no 1
    no_of_passengers 2
    flight_id 1
    user_id 1
    plane_id 1
    cost 2000
    factory :booking_with_passengers do
      transient do
        passengers_count 3
      end
      after(:create) do |booking, evaluator|
        create_list(:passenger, evaluator.passengers_count, booking: booking)
      end
    end
  end
  factory :invalid_booking, class: Booking do
    plane_id nil
  end
end
