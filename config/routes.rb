Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :spotify do
        get 'new_releases', to: 'spotify#new_releases'
        get 'bad_route', to: 'spotify#get_error'
        get 'featured_playlists', to: 'spotify#featured_playlists'
        get 'available_markets', to: 'spotify#available_markets'
      end
    end
  end
end


