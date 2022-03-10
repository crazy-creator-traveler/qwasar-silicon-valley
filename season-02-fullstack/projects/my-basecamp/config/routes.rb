Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home_pages#index"

  get "/how-it-works", to: "home_pages#how_it_works"
  
  get "/before-and-after", to: "home_pages#before_and_after"

  get "/features", to: "home_pages#features"
end
