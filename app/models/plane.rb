class Plane < ActiveRecord::Base
  belongs_to :airline
  belongs_to :flight
  validates :name, presence: true

  def self.available(id)
    self.where(flight_id: id).pluck(:name, :airline_id, :id)
  end

  def self.plane_name(flight_id)
    @flight_id = flight_id
    make_available
    @name
  end

  def self.airline_id
    @owner_id
  end

  def self.my_id
    @my_id
  end

  def self.obj(id)
    self.where(id: id).first
  end

  private
    def self.make_available
      @name = []
      @owner_id = []
      @my_id = []
      available(@flight_id).each do |item|
        @name << item[0]
        @owner_id << item[1].to_i
        @my_id << item[2].to_i
      end
    end
end
