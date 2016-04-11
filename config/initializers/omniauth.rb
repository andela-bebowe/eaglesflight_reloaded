Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV["Twitter_key"], ENV["Twitter_secret"],
  { image_size: "bigger"}
  provider :facebook, ENV["Facebook_id"], ENV["Facebook_secret"],
  :scope => "email", :info_fields => "name, email"
  provider :identity,
  :fields => [:name, :email],
  :on_failed_registration => IdentitiesController.action(:new)

  OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
  }
end
