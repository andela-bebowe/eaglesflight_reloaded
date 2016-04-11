class Passenger < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: {maximum: 50, minimum: 3}
  validates :email, presence: true, length: {maximum: 100, minimum: 4},
  format: {with: VALID_EMAIL_REGEX}
  belongs_to :booking, inverse_of: :passengers
  validates :booking, presence: true
end
