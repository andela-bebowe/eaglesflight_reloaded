def randi
  rand(1..30)
end
date = Time.zone.now + randi.day

def randi2
  rand(1..30)
end
date2 = Time.zone.now + randi2.day

def randi3
  rand(1..30)
end
date3 = Time.zone.now + randi3.day

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
  ["Boeing707", 6, randi],
  ["Boeing797", 5, randi2],
  ["M55",       4, randi3],
  ["HM125",     8, randi],
  ["Boeing790", 3, randi3],
  ["Boeing895", 2, randi2],
  ["Ericson",   1, randi],
  ["Hacky",     7, randi3],
  ["Mars",      9, randi2]
]

plane.each do |name, airline_id, flight_id|
  Plane.find_or_create_by(name: name, airline_id: airline_id, flight_id: flight_id)
end

airport = [
  ["Murtala Airport",             "Lagos"],
  ["National Airport",            "Portharcourt"],
  ["International Airport",       "Abuja"],
  ["Igbinedion Airport",          "Benin"],
  ["Private Airport",             "Kano"],
  ["Sourthern Airport",           "Delta"],
  ["Zagosa Murtala Airport",      "Sambisa"],
  ["Mystical Airport",            "Space"],
  ["Quagire Airport",             "Libya"],
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
  [1, 2, date, 4000],
  [2, 13, date2, 3000],
  [3, 4, date3, 3090],
  [4, 3, date2, 3300],
  [5, 4, date3, 3120],
  [6, 12, date, 4000],
  [7, 6, date2, 8330],
  [8, 4, date3, 30000],
  [9, 5, date, 4000],
  [10, 6, date2, 3000],
  [11, 7, date3, 3000],
  [12, 8, date, 40000],
  [13, 15, date2, 3000],
  [14, 11, date3, 3000],
  [15, 10, date, 4000],
  [1, 9, date2, 2500],
  [2, 10, date3, 3230],
  [3, 11, date, 4000]
]

flight.each do |dest, dept, date, price|
  Flight.find_or_create_by(destination_id: dest, departure_id: dept, departure_date: date, price: price)
end
