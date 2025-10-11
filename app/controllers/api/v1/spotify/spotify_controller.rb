module Api::V1::Spotify
  class SpotifyController < ApplicationController

    def new_releases
      result = V1::Spotify::Client.new_releases
        render json: result
    end

    def browse_categories
      result = V1::Spotify::Client.browse_categories
        render json: result
    end

    def available_markets
      result = V1::Spotify::Client.available_markets
        render json: result
    end    

    def get_error
      response = V1::Spotify::Client.bad_route
      render json: response
    end
  end
end
