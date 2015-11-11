module FlightsHelper
  def get_cost(flight, num)
    number_to_currency((flight.price * num), unit: "$")
  end
  def airports
    Airport.locations
  end
  def dates
    Flight.formatted_departure_date
  end
  def date(obj)
    obj.departure_date.strftime("%B %-d, %Y")
  end
  def time(obj)
    obj.departure_date.strftime("%I:%M %p")
  end
  def first(obj)
    obj.first
  end
  def dept(obj)
    first(obj).departure
  end
  def dest(obj)
    first(obj).destination
  end
end
