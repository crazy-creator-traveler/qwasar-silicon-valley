=begin
        Gandalf > For Testing Program Code > my_user_model.rb
=end

require_relative "my_user_model.rb"

def main
    firstname = "Sultan"
    lastname  = "Kyzyltau"
    age       =  22
    email     = "kyzyltau.sultan@gmail.com"
    password  = "my_password"
        
# TEST-1 > Creating New User
    puts("* * * * * * * * * * TEST-1. Creating New User * * * * * * * * * *")
    new_user = User.new()
    new_user.create(firstname: firstname, lastname: lastname, age: age, email: email, password: password)     
    puts("\n\n")
    
# TEST-2 > Reading User-Data with ID > 1
    puts("* * * * * * * * * * TEST-2. Reading User-Data with ID > 1 * * * * * * * * * *")
    user_data = User.new()
    if(user_data.get(1) == nil)
        puts("User Doesn't exist!"); puts("\n\n")
    else
        p(user_data.get(1)); puts("\n\n")
    end

# TEST-3 > Reading All Users-Data
    puts("* * * * * * * * * * TEST-3. Reading All Users-Data * * * * * * * * * *")
    if(user_data.all == nil)
        puts("Users doesn't exist !"); puts("\n\n")
    else
        p(user_data.all); puts("\n\n")
    end

# TEST-4 > Updating User-Data with ID > 1
    puts("* * * * * * * * * * TEST-4. Updating User-Data with ID > 1 * * * * * * * * * *")
    user_data.update(1, :password, "your_password")
    p(user_data.get(1)); puts("\n\n")

# TEST-5 > DESTROY User-Data with ID > 1
    puts("* * * * * * * * * * TEST-5. DESTROYING User-Data with ID > 1 * * * * * * * * * *")
    user_data.destroy(1)
    p(user_data.get(1)); puts("\n\n")

# TEST-6 > DESTROY All User-Data
    puts("* * * * * * * * * * TEST-6. DESTROYING All Users-Data * * * * * * * * * *")
    user_data.destroy_all
    p(user_data.all); puts
end

main()