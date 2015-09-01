require_relative 'spy'

class FireAMPDirect
  include HTTParty

  base_uri ENV['API_BASE_URI']
  headers('Accept' => 'application/json',
    'content-type' => 'application/json'
  )

  def self.common_parameters
    {api_key: ENV['FIREAMP_API_KEY'], client_id: ENV['FIREAMP_CLIENT_ID']}
  end

end

class FireAMP < FireAMPDirect
  include Spy
end