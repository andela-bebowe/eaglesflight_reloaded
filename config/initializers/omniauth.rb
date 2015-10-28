Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV["Twitter_key"], ENV["Twitter_secret"]
  provider :facebook, ENV["Facebook_id"], ENV["Facebook_secret"]
  provider :identity, on_failed_registration: lambda { |env|
    IdentitiesController.action(:new).call(env)
  }
end
