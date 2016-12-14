# SmsAlert Ruby

A Ruby Gem to communicate with SmsAlert Api to send Messages

## Installation

Add this line to your application's Gemfile:

    gem 'smsAlertruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install smsAlertruby

## Usage

## To connect to SmsAlert Api

    require 'smsAlertruby'
    api = SmsAlertruby::API.new(auth_key,senderid)
    api.send(mobileno, message, route)

eg: 

    require 'smsAlertruby'
    api = SmsAlertruby::API.new("apiramukhsakarpiaj","CVTECH")
    api.send(9999xxxxxx, "Test Message", "nondnd")
    api.send([9999xxxxxx,9999xxxxxx], "Test Message", "nondnd")

you can find your Auth-key here:  http://smsalert.co.in/api

## SMS Settings

You can generate a Yaml file to store the Sms Settings required for your application with following command

    rails g smsAlertruby:install

## Sms Alert Account Details

You can create your account on Sms Alert by simply singing up here:  https://smsalert.co.in/#register

If you are an startup company, you can avail sms credits for your Startup app. For more details visit: https://smsalert.co.in

