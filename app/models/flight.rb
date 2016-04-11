class Flight < ActiveRecord::Base
  belongs_to :destination, :class_name => "Airport"
  belongs_to :departure, :class_name => "Airport"

  validates_presence_of :destination_id, :departure_id, :departure_date,
  :airline_id
  has_many :bookings
  belongs_to :airline

  accepts_nested_attributes_for  :bookings, allow_destroy: true

  def self.get_date
    Flight.pluck("DISTINCT departure_date").sort
  end

  def self.formatted_departure_date
    date = get_date
    date.map{|format|format.strftime("%B %-d, %Y")}.uniq
  end

  def self.search(params)
    if !params[:flight].nil?
      @flight = params[:flight]
      assign_variables_for_search
      self.where(destination_id: @dest_id,
      departure_id: @dept_id, departure_date: @date)
    end
  end

  def self.assign_variables_for_search
    date = @flight[:departure_date].to_date
    @date = date.beginning_of_day..date.end_of_day
    @dest_id = @flight[:destination_id]
    @dept_id = @flight[:departure_id]
  end
end
