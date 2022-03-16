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
      get "/", to: "users#index", as: :user_root
      get "/sing-in", to: "devise/sessions#new", as: :new_user_session
      post "/sing-in", to: "devise/sessions#create", as: :user_session
      delete "/sign-out", to: "devise/sessions#destroy", as: :destroy_user_session

      scope "/password" do
        get "/new", to: "devise/passwords#new", as: :new_user_password
        get "/edit", to: "devise/passwords#edit", as: :edit_user_password
        patch "/", to: "devise/passwords#update", as: :user_password
        put "/", to: "devise/passwords#update"
        post "/", to: "devise/passwords#create"
      end

      get "/cancel", to: "devise/registrations#cancel", as: :cancel_user_registration
      get "/sign-up", to: "devise/registrations#new", as: :new_user_registration
      get "/account", to: "devise/registrations#edit", as: :edit_user_registration
      patch "/", to: "devise/registrations#update", as: :user_registration
      put "/", to: "devise/registrations#update"
      delete "/", to: "devise/registrations#destroy"
      post "/", to: "devise/registrations#create"
    end
  end

  devise_for :users, skip: :all
end
