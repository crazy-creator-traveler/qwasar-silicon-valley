=begin
NOTE:
  to: ".."
          ==> Starts searching in the Views-Component for the required html.erb file.
=end
Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "articles#index" # root route == http://localhost:3000                                        
  resources :articles do
    resources :comments
  end
end
