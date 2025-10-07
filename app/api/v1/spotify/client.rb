module V1
  module Spotify
    class Client
      def self.new_releases
        Request.call(http_method: "get", endpoint: "/browse/new-releases")
      end

      def self.several_artists(ids)
        id_string = ids.join(",")
        endpoint = "/artists?ids=#{id_string}"
        Request.call(http_method: "get", endpoint: endpoint)
      end

      def self.search_artist(name)
        encoded_name = URI.encode_www_form_component(name)
        endpoint = "/search?q=#{encoded_name}&type=artist"
        Request.call(http_method: "get", endpoint: endpoint)
      end


      def self.get_artist_id(name)
        response = search_artist(name)
        parsed = JSON.parse(response.body)

        # Try to find an exact match first
        match = parsed["artists"]["items"].find { |artist| artist["name"].downcase == name.downcase }

        # Fallback to first result if no exact match
        match ||= parsed["artists"]["items"].first

        match ? match["id"] : nil
      end
    end
  end
end
