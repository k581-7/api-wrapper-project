# api-wrapper-project
A Rails-based API wrapper for Spotify Web API, used for educational purposes.

Overview:

This is a custom API wrapper for the Spotify Web API, built inside a Rails application. It provides a modular, testable interface for fetching Spotify data such as new releases, featured playlists, and available markets.
The wrapper is exposed via controller actions and routes for easy testing and future integration into your app.

Features:

/api/v1/spotify/new_releases - Fetches the latest album releases
/api/v1/spotify/featured_playlists - Retrieves curated playlists for specific country (PH)
/api/v1/spotify/available_markets - Lists all Spotify-supported markets
/api/v1/spotify/bad_route - Simulates an error response for testing error handling

Modules: 

V1::Spotify::Client - Public interface for callin Spotify endpoints
V1::Spotify::Request - Handles authentication and requests
V1::Spotify::Errors - Maps http error codes to readable messages
Api::V1::Spotify::SpotifyController - Rails controller exposing wrapper methods via routes

How to use:

Start with authentication.

Uses Client Credentials Flow to fetch an access token from Spotify:
RestClient.post(
  'https://accounts.spotify.com/api/token',
  { grant_type: 'client_credentials' },
  {
    Authorization: "Basic #{Base64.strict_encode64("#{CLIENT_ID}:#{CLIENT_SECRET}")}",
    'Content-Type': 'application/x-www-form-urlencoded'
  }
)

Make sure to set your credentials in .env:
SPOTIFY_CLIENT_ID=your_client_id
SPOTIFY_CLIENT_SECRET=your_client_secret

Once your Rails server is running, you can test the wrapper via:

GET /api/v1/spotify/new_releases
GET /api/v1/spotify/featured_playlists
GET /api/v1/spotify/available_markets
GET /api/v1/spotify/bad_route

Each endpoint returns JSON responses directly from Spotify or a mapped error message.

Spotify errors are caught and translated into:

401 - "Unauthorized request. Please try again!"
404 - "Invalid Request!"
Others - "Service unavailable. Please try again!"

Notes:

This wrapper is scaffolded for testing and modularity. You can also extend it to include more endpoints like track search, artist details, etc. The /bad_route error simulation is just an example of customization. You can use this app for practice. Thank you!