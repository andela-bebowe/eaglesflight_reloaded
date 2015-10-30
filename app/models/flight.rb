class Flight < ActiveRecord::Base
  belongs_to :destination, :class_name => "Airport"
  belongs_to :departure, :class_name => "Airport"

  has_many :bookings
  has_many :planes

  accepts_nested_attributes_for  :bookings, allow_destroy: true

  def self.get_date
    Flight.pluck("DISTINCT departure_date").sort
  end

  def self.formatted_departure_date
    date = get_date
    date.map{|date|date.strftime("%B %-d, %Y")}
  end

  def date
    self.departure_date.strftime("%B %-d, %Y")
  end
  def time
    self.departure_date.strftime("%I:%M %p")
  end

  def self.search(params)
    if params[:flight]
      date = params[:flight][:departure_date].to_date
      date = date.beginning_of_day..date.end_of_day
      dest_id = params[:flight][:destination_id].to_i
      dept_id = params[:flight][:departure_id].to_i
      self.where(destination_id: dest_id, departure_id:  dept_id, departure_date: date)
    else
    end
  end
end
