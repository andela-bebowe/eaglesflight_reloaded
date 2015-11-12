source "https://rubygems.org"
ruby "2.2.3"

gem "rails", "4.2.4"
gem "figaro"
gem "sass-rails", "~> 5.0"
gem "bootstrap-sass"
gem "materialize-sass"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.1.0"
gem "activemerchant",
require: "active_merchant"
gem "paypal-express"
gem "active_utils"
gem "draper", "~> 1.3"
gem "jquery-rails"
gem "turbolinks"
gem "jbuilder", "~> 2.0"
gem "sdoc", "~> 0.4.0", group: :doc
gem "will_paginate-bootstrap"
gem "bcrypt-ruby"
gem "omniauth-identity"
gem "omniauth-twitter"
gem "omniauth-facebook"
group :development, :test do
  gem "byebug"
  gem "sqlite3"
  gem "pry"
  gem "web-console", "~> 2.0"
  gem "spring"
  gem "rspec-rails", "~> 3.0"
  gem "launchy", "~> 2.4"
  gem "letter_opener"
  gem "simplecov"
  gem "simplecov-json"
end

group :test do
  gem "codeclimate-test-reporter", require: nil
  gem "factory_girl_rails"
  gem "capybara"
  gem "database_cleaner"
  gem "coveralls", require: false
  gem 'selenium-webdriver'
end

group :production do
  gem "pg"
  gem "rails_12factor"
  gem "puma", "2.11.1"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
