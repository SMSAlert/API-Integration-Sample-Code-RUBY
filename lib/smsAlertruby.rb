require 'active_support/core_ext/module/attribute_accessors'
require "smsAlertruby/version"
require "smsAlertruby/options"
require "smsAlertruby/sources/yaml_source"
require "smsAlertruby/api"
require "net/http"
require "net/https"
require "uri"


module SmsAlertruby
  # ensures the setup only gets run once
  @@_ran_once = false

  mattr_accessor :const_name, :use_env
  @@const_name = "SmsSettings"
  @@use_env = false

  def self.setup
    yield self if @@_ran_once == false
    @@_ran_once = true
  end

 # Create a populated Options instance from a yaml file.  If a second yaml file is given, then the sections of that file will overwrite the sections
  # if the first file if they exist in the first file.
  def self.load_files(*files)
    config = Options.new

    # add yaml sources
    [files].flatten.compact.uniq.each do |file|
      config.add_source!(file.to_s)
    end

    config.load!
    config.load_env! if @@use_env
    config
  end

  # Loads and sets the settings constant!
  def self.load_and_set_settings(*files)
    Kernel.send(:remove_const, SmsAlertruby.const_name) if Kernel.const_defined?(SmsAlertruby.const_name)
    Kernel.const_set(SmsAlertruby.const_name, SmsAlertruby.load_files(files))
  end

  def self.reload!
    Kernel.const_get(SmsAlertruby.const_name).reload!
  end
end

require('smsAlertruby/integration/rails') if defined?(::Rails)
