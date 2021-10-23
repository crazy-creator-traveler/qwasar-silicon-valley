=begin
        Main Program Code

N O T E:
    All necessary info contained in README.md
...
    params > Key variable
                ==> Which contains recived data.
=end

require 'sinatra'
require_relative "my_user_model.rb"

set :port, 8090
#set :bind, '0.0.0.0'

post '/users' do # Creating New User
    # p(params)
    if(params.empty?)
        puts("You didn't enter any data!")
        return nil
    else
        user = User.new()
        user.create(params) # puts(params)
    end    
end

get '/users' do # Displaying All Users-Data > Except their password!
    user = User.new()
    data = user.all # "#{data}"
                    # puts("#{data}") # Will not work! We can display in Browser OR Terminal! But not in both same time !
    data.collect do |index|
        data = index.except(:password) 
        "#{data}\n"
    end
end

post '/sign_in' do
    # code...
end

put '/users' do
    # code...
end

delete '/sign_out' do
    # code...
end

delete '/users' do
    # code...
end