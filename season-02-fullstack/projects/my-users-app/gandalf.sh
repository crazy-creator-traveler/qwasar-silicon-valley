# # #
#   Gandalf > For Testing Program Code > app.rb
#
# NOTE:
#   - Command:
#           ./gandalf.sh
#                       ==> To run TESTER
# # #

HOST="localhost:8090"

# TEST-1 > Creating New User
curl -X POST -i $HOST/users -d "firstname=Luffi" -d "lastname=Monkey" -d "age=22" -d "email=my_email@gmail.com" -d "password=Luffi"

# TEST-2 > Reading All Users-Data
curl -i $HOST/users

# TEST-3 > Sign in to the system using: -email && -password 
curl -X POST -c cookies.txt -i $HOST/sign_in -d "email=my_email@gmail.com" -d "password=Luffi"
echo -e "\n\n"

# TEST-4 > Changing the password of an account > Provided that the user is already in the system
curl -X PUT -b cookies.txt -i $HOST/users -d "email=my_email@gmail.com" -d "password=Monkey"
echo

# TEST-5 > ...