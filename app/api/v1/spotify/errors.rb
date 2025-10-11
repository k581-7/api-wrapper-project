module V1
  module Spotify
    class Errors
      def self.map(code)
        case code
        when 401 
          return "Unauthorized request. Please try again!"
        when 404
          return "Oh no. Invalid Request!"
        else
          return "Service unavailable. Please try again!"
        end
      end
    end
  end
end