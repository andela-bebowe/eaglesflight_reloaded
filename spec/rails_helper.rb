ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
if Rails.env.production?
  abort("The Rails environment is running in production mode!")
end
require "simplecov-json"
  SimpleCov.formatter = SimpleCov::Formatter::JSONFormatter
require "coveralls"
  Coveralls.wear!
require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
require "spec_helper"
require "rspec/rails"
require "capybara/rspec"
require "capybara/rails"
require "factory_girl"
require "database_cleaner"

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include FactoryGirl::Syntax::Methods
  config.use_transactional_fixtures = false
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end
  config.before(:each) do |example|
    DatabaseCleaner.strategy =
      example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.start
OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
  provider: "facebook",
  uid: "123456",
  info:
  { name: "Blessing Ebowe",
    email: "blessingebowe@gmail.com",
    profile_img: "http://graph.facebook.com/1065771400114300/picture"
  }
    })
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
  config.infer_spec_type_from_file_location!
end
