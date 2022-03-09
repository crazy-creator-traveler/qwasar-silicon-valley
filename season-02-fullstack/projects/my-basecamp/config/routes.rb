Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home_pages#index"
  
  get "how-it-works", to: "home_pages#how_it_works"
end
