airline = [
  ["Dana Air",      5000],
  ["GIG Air",       2000],
  ["SafeWay Air",   3000],
  ["Galaxy Air",    1500],
  ["Eclypse Air",   5000],
  ["Arik Air",      8000],
  ["Smooth Air",    7000],
  ["Rocket",        150000],
  ["JetLine",       12000]
]

airline.each do |name, price|
  Airline.find_or_create_by(name: name, price: price)
end

plane = [
  ["Bell7",      9],
  ["Breling797", 6],
  ["M5",         7],
  ["HM2i5",      1],
  ["Boege790",   5],
  ["Boal5",      4],
  ["Ericon",     8],
  ["Hily",       2],
  ["Mails",      3]
]

25.times do
  plane.each do |name, airline_id|
    Plane.create(name: name, airline_id: airline_id, flight_id: rand(1..15))
  end
end
airport = [
  ["Konga Airport",               "Konga"],
  ["Konga Airport",               "Kwaga"],
  ["Zambisa Airport",             "Zambisa"],
  ["Murtala Airport",             "Jos"]
]
airport.each do |name, location|
  Airport.find_or_create_by(name: name, location: location)
end

date1 = Time.now + 13 * 86400
date2 = Time.now + 7 * 86400
date3 = Time.now + 4 * 86400
date4 = Time.now + 10 * 86400
flight = [
  [1, 2, date1, 4020],
  [2, 3, date2, 3090],
  [3, 4, date3, 3120],
  [2, 1, date4, 8330],
  [2, 3, date2, 3300],
  [4, 3, date4, 30900],
  [2, 1, date2, 4003],
  [1, 3, date3, 3080],
  [3, 4, date3, 4390],
  [2, 4, date2, 3009],
  [4, 3, date3, 4770],
  [1, 4, date1, 2500],
  [1, 3, date2, 3230],
  [3, 1, date3, 4000],
  [1, 2, date1, 3007]
]
flight.each do |dept, dest, date, price|
  Flight.find_or_create_by(destination_id: dest, departure_id: dept,
  departure_date: date + rand(5200..12000),
  price: price)
end
