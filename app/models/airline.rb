class Airline < ActiveRecord::Base
  # Flight owners
  validates :name, presence: true
  has_many :flights

  def to_s
    "#{name}"
  end
end
