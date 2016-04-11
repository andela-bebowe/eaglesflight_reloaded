FactoryGirl.define do
  factory :airport do
    name "Kwasi airport"
    location "Kwasi"
    id 1
    factory :airport2 do
      name "Kasti airport"
      location "Kasti"
      id 2
    end
    factory :airport3 do
      name "Shaggy airport"
      location "Shaggy"
      id 3
    end
    factory :airport4 do
      name "Krum airport"
      location "Krum"
      id 4
    end
    factory :invalid_airport do
      name nil
    end
    factory :invalid_airport2 do
      location nil
    end
  end
end
