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
    date.map{|date|date.strftime("%B %-d, %Y")}.uniq
  end

  def date
    self.departure_date.strftime("%B %-d, %Y")
  end
  def time
    self.departure_date.strftime("%I:%M %p")
  end

  def self.search(params)
    if !params[:flight].nil?
      @flight = params[:flight]
      assign_variables_for_search
      self.where(destination_id: @dest_id,
      departure_id: @dept_id, departure_date: @date)
    end
  end

  private
    def self.assign_variables_for_search
      date = @flight[:departure_date].to_date
      @date = date.beginning_of_day..date.end_of_day
      @dest_id = @flight[:destination_id]
      @dept_id = @flight[:departure_id]
    end
end
