Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :parks, only: [:index] do
        resources :trails, only: [:index]
        resources :flowers, only: [:index]
      end
    end
  end
end
