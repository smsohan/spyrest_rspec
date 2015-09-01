module Spy

  def self.included(base)
    base.class_eval do
      include HTTParty
      host = ENV['SPYREST_HOST'] || 'localhost'
      port = ENV['SPYREST_PORT'] || 9080

      puts "XXX using proxy #{host} #{port}"

      http_proxy host, port
      follow_redirects true
    end
  end

end