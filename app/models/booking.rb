class Booking < ActiveRecord::Base
  before_save :create_ticket_no

  belongs_to :user
  belongs_to :flight
  validates :no_of_passengers, presence: true
  validates :flight_id, presence: true

  has_many :passengers
  accepts_nested_attributes_for :passengers

  private
    def create_ticket_no
      self.ticket_no = self.id + 5000
    end
end
