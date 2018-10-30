Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web =>  "/sidekiq"

  namespace :api do
    namespace :v1 do
      resources :scrapers, only: [:index]
      resources :parks, only: [:index] do
        resources :trails, only: [:index]
        resources :flowers, only: [:index]
      end
    end
  end
end
