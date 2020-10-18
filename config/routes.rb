Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "/signup", to: "users#create"
      resources :account_activations, only: [:edit]
      scope :auth do
        post "/login", to: "authentication#create"
        get "/me", to: "authentication#show"
      end
    end
  end
end
