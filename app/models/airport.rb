class Airport < ActiveRecord::Base
  has_many :landings, :foreign_key => :destination_id, :class_name => "Flight"
  has_many :take_offs, :foreign_key => :departure_id, :class_name => "Flight"
  validates :name, presence: true
  validates :location, presence: true

  def self.locations
    Airport.distinct.pluck(:location, :id)
  end

  def to_s
    "#{name}, #{location}"
  end

end
