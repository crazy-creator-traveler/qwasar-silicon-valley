=begin
        Gandalf > For Testing Program Code > my_user_model.rb
=end

require_relative "my_user_model.rb"

$EXIT_SUCCESS = 0
$EXIT_FAILURE = 1

def check_duplicates(user_data, email)
    p(user_data) 
    if(user_data == nil)
        return $EXIT_SUCCESS

    elsif(email == user_data[0][4])
        return $EXIT_FAILURE

    else
        return $EXIT_SUCCESS
   end
end

def main
    firstname = "Sultan"
    lastname  = "Kyzyltau"
    age       =  22
    email     = "kyzyltau.sultann@gmail.com"
    password  = "Kyzyltau777"

    #if(check_duplicates(User.get(1), email) == 0) # User.get(1) > В дальнейшем надо будет заменить > Чтобы проверку провести через все существующие почты в базе данных...
        
# TEST-1 > Creating New User
    puts("* * * * * * * * * * TEST-1. Creating New User * * * * * * * * * *")
    new_user = User.new(); # Waiting array-data 
    new_user = new_user.create(firstname: firstname, lastname: lastname, age: age, email: email, password: password)     
        if(new_user.class == Array) # or we can use > new_user == []
            puts("Successfullly created new user !")
        else
            puts("User wasn't created !")
        end
    puts()

# TEST-2 > Reading User-Data with ID > 1
    puts("* * * * * * * * * * TEST-2. Reading User-Data with ID > 1 * * * * * * * * * *")
    user_data = User.new()
    p(user_data.get(1)); puts
        
 
# TEST-3 > Reading All Users-Data
    puts("* * * * * * * * * * TEST-3. Reading All Users-Data * * * * * * * * * *")
    pp(user_data.all); puts

# TEST-4 > Updating User-Data with ID > 1
    puts("* * * * * * * * * * TEST-4. Updating User-Data with ID > 1 * * * * * * * * * *")
    user_data.update(1, :password, "Sultan777")
    p(user_data.get(1)); puts

# TEST-5 > DESTROY User-Data with ID > 1
    puts("* * * * * * * * * * TEST-5. DESTROYING User-Data with ID > 1 * * * * * * * * * *")
    user_data.destroy(1)
    p(user_data.get(1)); puts

# TEST-6 > DESTROY All User-Data
    puts("* * * * * * * * * * TEST-6. DESTROYING All Users-Data * * * * * * * * * *")
    user_data.destroy_all
    p(user_data.all); puts
    
    #else
     #   puts("This user already exists in the Database!")
    #end

end

main()