Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "/", to: "welcome#index"
      post "/signup", to: "users#create"
      resources :account_activations, only: [:edit]
      resources :password_resets, only: [:create, :edit]
      put "/password_resets", to: "password_resets#update"
      resources :users, only: [:update]

      scope :auth do
        post "/login", to: "authentication#create"
        get "/me", to: "authentication#show"
      end

      scope :location do
        get "/districts/:id", to: "location#show"
      end

      namespace :travellers do
        resources :places, only: [:index, :show]
        resources :bookings, only: [:create, :index]
        resources :reviews, only: [:create, :update, :destroy]
        resources :bookmarks, only: [:index]
        delete ":place_id/bookmarks", to: "bookmarks#destroy"
        post ":place_id/bookmarks", to: "bookmarks#create"
      end

      namespace :hosts do
        put "/switching", to: "switching#edit"
      end
    end
  end
end
