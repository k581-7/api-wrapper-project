# api-wrapper-project
A Rails-based API wrapper for Spotify Web API, used for educational purposes.

# Overview:
This is a custom API wrapper for the Spotify Web API, built inside a Rails application.  
It provides a modular, testable interface for fetching Spotify data such as new releases, featured playlists, and available markets.  
The wrapper is exposed via controller actions and routes for easy testing and future integration into your app.

# Features:
/api/v1/spotify/new_releases - Fetches the latest album releases  
/api/v1/spotify/browse_categories - Retrieves available categories 
/api/v1/spotify/available_markets - Lists all Spotify-supported markets  
/api/v1/spotify/bad_route - Simulates an error response for testing error handling

# Modules:
V1::Spotify::Client - Public interface for calling Spotify endpoints  
V1::Spotify::Request - Handles authentication and requests  
V1::Spotify::Errors - Maps HTTP error codes to readable messages  
Api::V1::Spotify::SpotifyController - Rails controller exposing wrapper methods via routes

# Make sure to set your credentials in .env:
```ruby
SPOTIFY_CLIENT_ID=your_client_id
SPOTIFY_CLIENT_SECRET=your_client_secret
```
You can get these from Spotify Developer Dashboard. Link at the bottom source.

# Fork or download the repo
So you can run the existing files and modify them as you needed. (client, errors, request, controller, and routes)


# Once your Rails server is running, you can also check it via POSTMAN

- http://[::1]:3000/api/v1/spotify/new_releases
- http://[::1]:3000/api/v1/spotify/browse_categories
- http://[::1]:3000/api/v1/spotify/available_markets
- http://[::1]:3000/api/v1/spotify/bad_routes

# Mapped errors:

- 401 - "Unauthorized request. Please try again!"
- 404 - "Oh no. Invalid Request!"
- Others - "Service unavailable. Please try again!"

# Notes:

This wrapper is scaffolded for testing and modularity. You can also extend it to include more endpoints like track search, artist details, etc. The /bad_route error simulation is just an example of customization. You can use this app for practice. Thank you!

# Source API :
https://developer.spotify.com/documentation/web-api