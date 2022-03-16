Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "home_pages#index"

  resources :users, only: :index # or :only => [:index]

  devise_scope :user do
    scope "/user" do
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
    end
  end

  devise_for :users, skip: [:sessions, :password ]

  get "/how-it-works", to: "home_pages#how_it_works"

  get "/before-and-after", to: "home_pages#before_and_after"

  get "/features", to: "home_pages#features"

  get "/features/clients", to: "home_pages#clients"
  
  get "/pricing", to: "home_pages#pricing"

  get "/support", to: "home_pages#support"
end
