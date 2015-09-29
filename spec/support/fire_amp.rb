require_relative 'spy'

class FireAMPDirect
  include HTTParty

  def self.common_parameters
    {basic_auth: {username: ENV['FIREAMP_CLIENT_ID'], password: ENV['FIREAMP_API_KEY']}}
  end

  def self.init_httparty
    base_uri ENV['API_BASE_URI']
    headers('Accept' => 'application/json',
      'content-type' => 'application/json'
    )
  end

  init_httparty

end

class FireAMP < FireAMPDirect
  include Spy

  init_httparty
end