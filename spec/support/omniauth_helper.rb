def set_invalid_omniauth
  OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
end
OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
  provider: "facebook",
  uid: "123456",
  info:
  { name: "Blessing Ebowe",
    email: "blessingebowe@gmail.com",
    profile_img: "http://graph.facebook.com/1065771400114300/picture"
  }
    })
