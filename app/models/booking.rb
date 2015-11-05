class Booking < ActiveRecord::Base
  before_save :create_ticket_no
  after_update :save_passengers

  delegate :destination, :departure, :date, :time,
  :to => :flight, :prefix => true
  delegate :name, :to => :plane, :prefix => true

  belongs_to :user
  belongs_to :plane
  belongs_to :flight
  has_many :passengers, :dependent => :destroy
  validates_associated :passengers

  accepts_nested_attributes_for :passengers,
  reject_if: proc { |attributes| attributes['name'].blank? },
  allow_destroy: true

  def self.find_booking(params)
    self.where(user_id: params[:user_id], id: params[:id],
    passenger_id: params[:passenger_id])
  end

  def save_passengers
   passengers.each do |passenger|
     passenger.save(false)
   end
  end

  private
    def create_ticket_no
      self.ticket_no = self.plane_id + self.flight_id + 5000
    end
end
