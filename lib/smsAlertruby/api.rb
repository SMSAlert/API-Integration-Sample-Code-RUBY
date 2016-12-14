module SmsAlertruby
  class API
    attr_accessor :auth_key, :senderid
    URL = "http://www.smsalert.co.in"
    def initialize(auth_key, senderid)
      @auth_key = auth_key
      @senderid = senderid
      @url = URL
    end

    def send(mobilenos,msg,route)
      mobile_nos = mobilenos.is_a?(Array) ? mobilenos.join(',') : mobilenos
      params = {:apikey => auth_key, :mobileno => mobile_nos, :text => msg , :sender => senderid ,:route => route, :response => "json"}
      uri = full_path('/api/push.json?', params)
      response = Net::HTTP.get(uri)
    end

    def full_path(path, params)
      encoded_params = URI.encode_www_form(params)
      params_string = [path, encoded_params].join("?")
      URI.parse(@url + params_string)
    end
  end
end
