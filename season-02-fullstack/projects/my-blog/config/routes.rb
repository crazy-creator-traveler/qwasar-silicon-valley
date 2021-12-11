Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/articles", to: "articles#index" # to: ".." > Starts searching in the Views-Component 
                                        # for the required html.erb file.
end
