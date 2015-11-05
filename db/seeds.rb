def randi
  rand(1..15)
end
def randi2
  rand(1..15)
end
def randi3
  rand(1..15)
end
def randi4
  rand(1..15)
end
def randi5
  rand(1..15)
end
def randi6
  rand(1..15)
end

date = Time.now + (randi * 86400 + (randi * 40))
date2 = date + (randi * 300)
date3 = date2 + randi
date4 = date3 + (randi * 3600)
date5 = date2 + randi * 45667
date6 = date5 + (randi * 3060)
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
  ["Bell7", 3, randi],
  ["Breling797", 9, randi2],
  ["M5",       4, randi3],
  ["HM2i5",     1, randi4],
  ["Boege790", 5, randi5],
  ["Boal5", 4, randi6],
  ["Ericon",   8, randi],
  ["Hily",     8, randi3],
  ["Mails",      3, randi2]
]

  plane.each do |name, airline_id, flight_id|
  Plane.create(name: name, airline_id: airline_id, flight_id: flight_id)
  end
airport = [
  ["Konga Airport",               "Konga"],
  ["Konga Airport",               "Kwaga"],
  ["Zambisa Airport",             "Zambisa"],
  ["Murtala Mohammed Airport",    "Jos"],
  ["Zambia Airport",              "Zambia"],
  ["Anambra Airport",             "Anambra"]
]
airport.each do |name, location|
  Airport.find_or_create_by(name: name, location: location)
end

flight = [
  [1, 2, date, 4020],
  [2, 1, date2, 300],
  [3, 4, date3, 3090],
  [4, 3, date4, 3300],
  [5, 4, date3, 3120],
  [6, 3, date, 430],
  [2, 6, date2, 8330],
  [5, 3, date5, 30900],
  [4, 5, date6, 4003],
  [3, 6, date2, 3000],
  [1, 2, date3, 3000],
  [4, 5, date4, 4000],
  [1, 4, date2, 2500],
  [2, 3, date5, 3230],
  [3, 6, date6, 4000]
]

flight.each do |dest, dept, date, price|
  Flight.find_or_create_by(destination_id: dest, departure_id: dept, departure_date: date, price: price)
end
