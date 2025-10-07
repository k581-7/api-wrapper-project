require 'rest-client'

module V1
  module Rawg
    class Request

      TOKEN = ENV['RAWG_API_KEY']
      BASE_URL = 'https://api.rawg.io/api'

      def self.call(http_method:, endpoint:)
        RestClient::Request.execute(
          method: http_method,
          url: "#{BASE_URL}#{endpoint}?key=#{TOKEN}",
          headers: {'Content-Type' => 'application/json'}
        )
      end
    end
  end
end
