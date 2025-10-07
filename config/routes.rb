Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :spotify do
        get 'new_releases', to: 'spotify#new_releases'
      end
    end
  end
end


