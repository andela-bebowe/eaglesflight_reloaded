class Airline < ActiveRecord::Base
  validates :name, presence: true
  validates :price, presence: true
  has_many :planes

  def self.available
    Airline.where(:id => Plane.airline_id).pluck(:name, :price)
  end

  def self.the_name
    get_attr
    @name
  end

  def self.my_obj(id)
    Airline.where(:id => id).pluck(:name).shift
  end

  def self.my_price(id)
    Airline.where(:id => id).pluck(:price).shift
  end

  def self.price
    @price
  end

  private
    def self.get_attr
      @name = []
      @price = []
      available.each do |item|
        @name << item[0]
        @price << item[1]
      end
    end
end
