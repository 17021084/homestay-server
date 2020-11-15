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

      namespace :travellers do
        resources :places, only: [:index, :show]
      end
    end
  end
end
