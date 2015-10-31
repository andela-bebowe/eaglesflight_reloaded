class Airport < ActiveRecord::Base
  has_many :landings, :foreign_key => :destination_id, :class_name => "Flight"
  has_many :take_offs, :foreign_key => :departure_id, :class_name => "Flight"
  validates :name, presence: true
  validates :location, presence: true

  def self.locations
    Airport.distinct.pluck(:location, :id)
  end

  def  self.position(id)
    airport = Airport.where(id: id.to_i).pluck(:location, :name)
    "#{airport[0][1]}, #{airport[0][0]}"
  end
end
