require 'rest-client'
require 'json'
require 'base64'

module V1
  module Spotify
    class Request
      CLIENT_ID = ENV['SPOTIFY_CLIENT_ID']
      CLIENT_SECRET = ENV['SPOTIFY_CLIENT_SECRET']
      TOKEN_URL = 'https://accounts.spotify.com/api/token'
      BASE_URL = 'https://api.spotify.com/v1'

      def self.access_token
        response = RestClient.post(
          TOKEN_URL,
          { grant_type: 'client_credentials' },
          {
            Authorization: "Basic #{Base64.strict_encode64("#{CLIENT_ID}:#{CLIENT_SECRET}")}",
            'Content-Type': 'application/x-www-form-urlencoded'
          }
        )
        JSON.parse(response.body)['access_token']
      end

      def self.call(http_method:, endpoint:)
        begin
          token = access_token
          puts "ACCESS TOKEN: #{token}"
          response = RestClient::Request.execute(
            method: http_method,
            url: "#{BASE_URL}#{endpoint}",
            headers: {
              'Authorization': "Bearer #{token}",
              'Content-Type': 'application/json'
            }
          )
          JSON.parse(response.body)
        rescue RestClient::ExceptionWithResponse => e
          { code: e.http_code, status: e.message, data: Errors.map(e.http_code) }
        end
      end
    end
  end
end
