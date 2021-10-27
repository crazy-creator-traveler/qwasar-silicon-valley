=begin
        Main Program Code of the Controller-Block

N O T E:
    All necessary info contained in README.md
* * *
    params > Key Variable (by default > Sinatra)
                ==> Which contains received data > In Hash-Data type.
EXAMPLE:
    1) params   > Contain all received data
    "#{params}" > To display all recived data.

    2) params[:key_name]   > Contain certain received data
    "#{params[:key_name]}" > To display Value of the Key_Name.
=end

require 'sinatra'
require_relative "my_user_model.rb"

set :port, 8090
# set :bind, '0.0.0.0'
enable :sessions # To use SESSIONS

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
        "#{data}"
    end
end

post '/sign_in' do
    #"#{params[:email]}"
    users = User.new()
    users = users.all

    users.each do |user|
        if(user[:email] == params[:email] && user[:password] == params[:password])
            # p(user[:id]);   # p(session[:user_id])
            session[:user_id] = user[:id] # puts(ssession)
            message = "Welcome #{user[:firstname]}!" 
            
            return message
        else
            session[:user_id] = nil; 
            # puts("User not exist") # To display in Terminal
        end
    end 
end

put '/users' do
    if(session[:user_id])
        user = User.new()
        user = user.get(session[:user_id]) # p(session[:user_id])
        "User #{user[:firstname]} is already Authorized !"
    else
        "User #{user[:firstname]} isn't Authorized !"
    end
end

delete '/sign_out' do
    # code...
end

delete '/users' do
    # code...
end