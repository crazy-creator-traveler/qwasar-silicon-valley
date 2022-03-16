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
    end
  end

  devise_for :users, skip: :sessions

  get "/how-it-works", to: "home_pages#how_it_works"
  
  get "/before-and-after", to: "home_pages#before_and_after"

  get "/features", to: "home_pages#features"

  get "/features/clients", to: "home_pages#clients"
  
  get "/pricing", to: "home_pages#pricing"

  get "/support", to: "home_pages#support"
end
