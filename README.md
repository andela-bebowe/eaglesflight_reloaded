# EaglesFlight[![Coverage Status](https://coveralls.io/repos/andela-bebowe/eaglesflight_reloaded/badge.svg?branch=temp&service=github)](https://coveralls.io/github/andela-bebowe/eaglesflight_reloaded?branch=temp)
[![Code Climate](https://codeclimate.com/github/andela-bebowe/eaglesflight_reloaded/badges/gpa.svg)](https://codeclimate.com/github/andela-bebowe/eaglesflight_reloaded)
This is a web app that can be used for Flight Booking and Management within Nigeria.
[![Test Coverage](https://codeclimate.com/github/andela-bebowe/eaglesflight_reloaded/badges/coverage.svg)](https://codeclimate.com/github/andela-bebowe/eaglesflight_reloaded/coverage)
## Description

* EaglesFlight is hosted on [Heroku](https://eagles-flight.herokuapp.com)
* It's a Flight management system for flight bookings, information and payments.
* It can be used by both Registered and Unregistered users.


## Usage

* When you visit the page you can you can either choose to Register/Login or not.
* When on page you can choose location and destination of flight.
* A page containing available flights to your destination will be displayed to you.
* You can then choose your preferred flight provider.
* Now you can book a flight, by registering your name and ID number.
* The cost of flight is displayed to you.
* Click the Pay button to be directed to the Paypal payment system, where you can then pay for the flight.
* After payment your ticket is displayed to you, and sent to your email.

## More Info

* You can also book a flight for up to 5 people at once.
* You can also cancel or postpone your flight, before flight date.
* As a registered user your Flight booking details are saved for you for future references.

## Contributing

1. Fork it ( https://github.com/[andela-bebowe]/eagles_flight/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request.

## Development/Dependencies

* This web app was built using Ruby on Rails.
* And a rich library of gems from Ruby gems
  *Omniauth for Authentication
  *Figaro for Environment variables storage
  *Bcrypt for Password security
  *Mailer for sending mails
  *RSpec for testing.
