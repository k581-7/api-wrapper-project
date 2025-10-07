module Api::V1::Spotify
  class SpotifyController < ApplicationController
    def new_releases
      response = V1::Spotify::Client.new_releases
      render json: JSON.parse(response.body)
    rescue => e
      render json: { error: e.message }, status: :bad_request
    end
  end
end
