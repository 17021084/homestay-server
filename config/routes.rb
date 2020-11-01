Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "/signup", to: "users#create"
      resources :account_activations, only: [:edit]
      resources :password_resets, only: [:create, :edit]
      put "/password_resets", to: "password_resets#update"
      resources :users, only: [:update]

      scope :auth do
        post "/login", to: "authentication#create"
        get "/me", to: "authentication#show"
      end

      scope :places do
        post "/search", to: "places#search"
      end

    end
  end
  get "/test_header", to: "api#test_header"
end
