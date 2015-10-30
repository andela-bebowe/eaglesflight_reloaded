class Plane < ActiveRecord::Base
  belongs_to :airline
  belongs_to :flight
  validates :name, presence: true

  def self.available(id)
    Plane.where(flight_id:  id).pluck(:name, :airline_id)
  end

  def self.plane_name(flight_id)
    @flight_id = flight_id
    make_available
    @name
  end

  def self.owner_id
    @owner_id
  end

  private
    def self.make_available
      @name = []
      @owner_id = []
      available(@flight_id).each do |item|
        @name << item[0]
        @owner_id << item[1].to_i
      end
    end
end
