module FlightsHelper
  def get_cost(airline, flight, num)
    (number_to_currency(((airline.price + flight.price)* num), :unit => "$"))
  end
  def airports
    Airport.locations
  end
  def dates
    Flight.formatted_departure_date
  end
end
