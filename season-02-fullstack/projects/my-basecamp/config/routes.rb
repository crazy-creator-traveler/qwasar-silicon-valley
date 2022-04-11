Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "home_pages#index"

  scope "/" do
    get "/how-it-works", to: "home_pages#how_it_works"
    get "/before-and-after", to: "home_pages#before_and_after"

    scope "/features" do
      get "/", to: "home_pages#features", as: :features
      get "/clients", to: "home_pages#clients", as: :features_clients
    end

    get "/pricing", to: "home_pages#pricing"
    get "/support", to: "home_pages#support"
  end

  devise_scope :user do
    scope "/user" do
      get "/", to: "users/home_pages#index", as: :user_root
      get "/sing-in", to: "users/sessions#new", as: :new_user_session
      post "/sing-in", to: "users/sessions#create", as: :user_session
      delete "/sign-out", to: "users/sessions#destroy", as: :destroy_user_session

      scope "/password" do
        get "/new", to: "users/passwords#new", as: :new_user_password
        get "/edit", to: "users/passwords#edit", as: :edit_user_password
        patch "/", to: "users/passwords#update", as: :user_password
        put "/", to: "users/passwords#update"
        post "/", to: "users/passwords#create"
      end

      get "/cancel", to: "users/registrations#cancel", as: :cancel_user_registration
      get "/sign-up", to: "users/registrations#new", as: :new_user_registration
      get "/account", to: "users/registrations#edit", as: :edit_user_registration
      patch "/", to: "users/registrations#update", as: :user_registration
      put "/", to: "users/registrations#update"
      delete "/", to: "users/registrations#destroy"
      post "/", to: "users/registrations#create"
    end
  end

  devise_for :users, skip: :all
end
