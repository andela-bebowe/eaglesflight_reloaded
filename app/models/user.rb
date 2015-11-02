class User < ActiveRecord::Base
  has_many :bookings
  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"],
    auth["uid"]) || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    info = auth["info"]
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.profile_img = info["image"]
      user.name = info["name"]
      user.email = info["email"]
    end
  end

  def all_bookings
    self.bookings
  end

end
