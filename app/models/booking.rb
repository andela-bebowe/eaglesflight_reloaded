class Booking < ActiveRecord::Base
  before_save :create_ticket_no

  belongs_to :user
  belongs_to :plane
  belongs_to :flight
  has_many :passengers
  validates_presence_of :no_of_passengers, :plane_id, :cost, :flight_id

  accepts_nested_attributes_for :passengers, :reject_if => lambda { |a| a[:email].blank? }
  validates_associated :passengers
  private
    def create_ticket_no
      self.ticket_no = self.plane_id + self.flight_id + 5000
    end
end
