# def randi
#   rand(1..30)
# end
# date = Time.zone.now + randi.day + randi
#
# def randi2
#   rand(1..30)
# end
# date2 = Time.zone.now + randi2.day + randi
#
# def randi3
#   rand(1..30)
# end
# date3 = Time.zone.now + randi3.day + randi2
#
# def randi4
#   rand(1..30)
# end
# date4 = Time.zone.now + randi.day + randi4
#
# def randi5
#   rand(1..30)
# end
# date5 = Time.zone.now + randi5.day + randi3
#
# def randi6
#   rand(1..30)
# end
# date6 = Time.zone.now + randi2.day + randi6
# airline = [
#   ["Dana Air",      5000],
#   ["GIG Air",       2000],
#   ["SafeWay Air",   3000],
#   ["Galaxy Air",    1500],
#   ["Eclypse Air",   5000],
#   ["Arik Air",      8000],
#   ["Smooth Air",    7000],
#   ["Rocket",        150000],
#   ["JetLine",       12000]
# ]
#
# airline.each do |name, price|
#   Airline.find_or_create_by(name: name, price: price)
# end

# plane = [
#   ["Boe7", 3, randi],
#   ["Breking797", 9, randi2],
#   ["M5",       4, randi3],
#   ["HM125",     1, randi4],
#   ["Boeing790", 5, randi5],
#   ["Boa5", 4, randi6],
#   ["Ericon",   8, randi],
#   ["Hiky",     8, randi3],
#   ["Maris",      3, randi2]
# ]
#
#   plane.each do |name, airline_id, flight_id|
#   Plane.create(name: name, airline_id: airline_id, flight_id: flight_id)
#   end
# airport = [
#   ["Murtala Airport",             "Lagos"],
#   ["National Airport",            "Portharcourt"],
#   ["International Airport",       "Abuja"],
#   ["Zagosa Murtala Airport",      "Sambisa"],
#   ["Mystical Airport",            "Space"],
#   ["Quagire Airport",             "Libya"],
#   ["Konga Airport",               "Konga"],
#   ["Konga Airport",               "Kwaga"],
#   ["Zambisa Airport",             "Zambisa"],
#   ["Murtala Mohammed Airport",    "Jos"],
#   ["Zambia Airport",              "Zambia"],
#   ["Anambra Airport",             "Anambra"]
# ]
# airport.each do |name, location|
#   Airport.find_or_create_by(name: name, location: location)
# end

# flight = [
#   [1, 2, date, 4020],
#   [2, 1, date2, 300],
#   [3, 4, date3, 3090],
#   [4, 3, date4, 3300],
#   [5, 4, date3, 3120],
#   [6, 12, date, 430],
#   [7, 6, date2, 8330],
#   [8, 4, date5, 30900],
#   [9, 5, date6, 4003],
#   [10, 6, date2, 3000],
#   [11, 7, date3, 3000],
#   [12, 8, date4, 4000],
#   [1, 9, date2, 2500],
#   [2, 10, date5, 3230],
#   [3, 11, date6, 4000]
# ]
#
# flight.each do |dest, dept, date, price|
#   Flight.find_or_create_by(destination_id: dest, departure_id: dept, departure_date: date, price: price)
# end
