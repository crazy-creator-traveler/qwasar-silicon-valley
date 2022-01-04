=begin
NOTE:
  to: ".."
          ==> Starts searching in the Views-Component for the required html.erb file.
=end
Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "articles#index" # root route == http://localhost:3000                                        
  
  resources :articles do
    # This creates comments as a nested resource within articles
    # and thus we automatically get all the necessary paths for CRUD operations to work with comments.
    # NOTE:
    #   For more information about routing, see the Rails Routing guide > https://guides.rubyonrails.org/v6.1/routing.html#nested-resources
    resources :comments
  end
end
