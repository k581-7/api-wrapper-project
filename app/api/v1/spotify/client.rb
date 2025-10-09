module V1
  module Spotify
    class Client
      def self.new_releases
        Request.call(http_method: "get", endpoint: "/browse/new-releases")
      end

      def self.featured_playlists
        Request.call(http_method: "get", endpoint: "/browse/featured-playlists?country=PH")
      end

      def self.available_markets
        Request.call(http_method: "get", endpoint: "/markets")
      end   
      
      def self.bad_route
        Request.call(http_method: "get", endpoint: "/this-does-not-exist")
      end
    end
  end
end
