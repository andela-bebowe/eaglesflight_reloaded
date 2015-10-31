class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
    has_many :booking_records, :foreign_key => :user_id, :class_name => "Booking"
  end
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.profile_img = auth["info"]["image"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
    end
  end
end
