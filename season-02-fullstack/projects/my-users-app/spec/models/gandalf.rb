=begin
        Gandalf > For Testing Program Code > my_user_model.rb
=end

require "../../app/models/my_user_model.rb"

def main()
    firstname = "Sultan"
    lastname  = "Kyzyltau"
    age       =  22
    email     = "kyzyltau.sultan@gmail.com"
    password  = "my_password"

# TEST-1 > Creating New User
    puts("* * * * * * * * * * TEST-1. Creating New User * * * * * * * * * *")
    create_r = User.new.create(firstname: firstname, lastname: lastname, age: age, email: email, password: password)    
        if(create_r[:value] == true)
            puts(create_r[:description]); puts("\n\n")
        else
            puts(create_r[:description]); puts("\n\n")
        end

# TEST-2 > Reading User-Data with ID > 1
    puts("* * * * * * * * * * TEST-2. Reading User-Data with ID > 1 * * * * * * * * * *")
    user_data = User.new()
    if(user_data.get(1) == nil)
        puts("User not exist!"); puts("\n\n")
    else
        p(user_data.get(1)); puts("\n\n")
    end

# TEST-3 > Reading All Users-Data
    puts("* * * * * * * * * * TEST-3. Reading All Users-Data * * * * * * * * * *")
    if(user_data.all == nil)
        puts("Users not exist!"); puts("\n\n")
    else
        p(user_data.all); puts("\n\n")
    end

# TEST-4 > Updating User-Data with ID > 1
    puts("* * * * * * * * * * TEST-4. Updating User-Data with ID > 1 * * * * * * * * * *")
    update_r = user_data.update(1, :password, "your_password")
        if(update_r[:value] == true)
            puts(update_r[:description])
            p(user_data.get(1)); puts("\n\n")
        else
            puts(update_r[:description]); puts("\n\n")
        end

# TEST-5 > DESTROY User-Data with ID > 1
    puts("* * * * * * * * * * TEST-5. DESTROYING User-Data with ID > 1 * * * * * * * * * *")
    destroy_r = user_data.destroy(1)
        if(destroy_r[:value] == true)
            puts(destroy_r[:description])
            p(user_data.get(1)); puts("\n\n")
        else
            puts(destroy_r[:description]); puts("\n\n")
        end

# TEST-6 > DESTROY All User-Data
    puts("* * * * * * * * * * TEST-6. DESTROYING All Users-Data * * * * * * * * * *")
    destroy_all_r = user_data.destroy_all
        if(destroy_all_r[:value] == true)
            puts(destroy_all_r[:description])
            p(user_data.all); puts
        else
            puts(destroy_all_r[:description]); puts
        end
        
return 0
end

main()