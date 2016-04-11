airline = [
  "Dana Air",
  "GIG Air",
  "SafeWay Air",
  "Galaxy Air",
  "Eclypse Air",
  "Arik Air",
  "Smooth Air",
  "Rocket",
  "JetLine"
]

airline.each do |name|
  Airline.find_or_create_by(name: name)
end

airport = [
  ["Lagos Airport", "Lagos"],
  ["Abuja Airport", "Abuja"],
  ["Jos Airport", "Jos"],
  ["Benin Airport", "Benin"],
  ["Benue Airport", "Benue"],
  ["Malawi Airport", "Malawi"],
  ["Malasia Airport", "Malasia"],
  ["Ghana Airport", "Ghana"]
]
airport.each do |name, location|
  Airport.find_or_create_by(name: name, location: location)
end

150.times do
  Flight.find_or_create_by(destination_id: rand(1..4), departure_id: rand(5..8),
  departure_date: Time.zone.now + (rand(5..7) * 86400) + rand(3600..70000),
  airline_id: rand(1..9), price: rand(10000..90000))
end
150.times do
  Flight.find_or_create_by(destination_id: rand(5..8), departure_id: rand(1..4),
  departure_date: Time.zone.now + (rand(5..7) * 86400) + rand(3600..70000),
  airline_id: rand(1..9), price: rand(10000..90000))
end
