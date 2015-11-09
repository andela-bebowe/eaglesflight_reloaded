class Booking < ActiveRecord::Base
  before_save :create_ticket_no

  delegate :destination, :departure,
  :to => :flight, :prefix => true
  delegate :name, :airline, :to => :plane, :prefix => true

  has_one :booker
  belongs_to :user
  belongs_to :plane
  belongs_to :flight
  has_many :passengers, inverse_of: :booking, dependent: :destroy
  validates_associated :passengers

  accepts_nested_attributes_for :passengers,
  reject_if: proc { |attributes| attributes['name'].blank? },
  allow_destroy: true

  def date
    self.flight.departure_date.strftime("%B %-d, %Y")
  end

  def time
    self.flight.departure_date.strftime("%I:%M %p")
  end

  def self.find_booking(params)
    self.where(id: params[:id],
    ticket_no: params[:ticket_no]).first
  end

  private
    def create_ticket_no
      self.ticket_no = self.plane_id + self.flight_id + 5000
    end
end
