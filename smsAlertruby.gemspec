# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$:.unshift(lib) unless $:.include?(lib)
require 'smsAlertruby/version'

Gem::Specification.new do |spec|
  spec.name          = "smsAlertruby"
  spec.version       = SmsAlertruby::VERSION
  spec.authors       = ["Cozy Vision"]
  spec.email         = ["prashant@cozyvision.com"]
  spec.summary       = %q{A Ruby gem to connect with Sms Alert Api to send messages}
  spec.description   = %q{Connects to Sms Alert api to send messages}
  spec.homepage      = "https://github.com/smsalert/"
  spec.license       = "CVT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_dependency "bundler", ">= 2.2.10"
end
