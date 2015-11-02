class Booking < ActiveRecord::Base
  before_save :create_ticket_no

  delegate :destination, :departure, :date, :time,
  :to => :flight, :prefix => true
  delegate :name, :to => :plane, :prefix => true

  belongs_to :user
  belongs_to :plane
  belongs_to :flight
  has_many :passengers
  validates_presence_of :no_of_passengers, :plane_id, :cost, :flight_id

  accepts_nested_attributes_for :passengers,
  :reject_if => lambda { |passenger| passenger[:email].blank? }
  validates_associated :passengers
  private
    def create_ticket_no
      self.ticket_no = self.plane_id + self.flight_id + 5000
    end
end
