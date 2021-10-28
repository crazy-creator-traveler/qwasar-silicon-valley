# # #
#   Gandalf > For Testing Program Code > app.rb
#
# NOTE:
#   - Command:
#           ./gandalf.sh
#                       ==> To run TESTER
# # #

HOST="localhost:8090"

# TEST-1 > Creating a New User.
echo -e "\n* * * * * * * * * * * * * * * TEST-1 * * * * * * * * * * * * * * *"
curl -X POST -i $HOST/users -d "firstname=Luffi" -d "lastname=Monkey" -d "age=22" -d "email=my_email@gmail.com" -d "password=Luffi"

# TEST-2 > Reading All Users-Data.
echo -e "\n\n* * * * * * * * * * * * * * * TEST-2 * * * * * * * * * * * * * * *"
curl -i $HOST/users

# TEST-3 > Sign in to the system using: -email && -password.
echo -e "\n\n* * * * * * * * * * * * * * * TEST-3 * * * * * * * * * * * * * * *"
curl -X POST -c cookies.txt -i $HOST/sign_in -d "email=my_email@gmail.com" -d "password=Luffi"

# TEST-4 > Changing the password of an account > Provided that the user is already in the system.
echo -e "\n\n* * * * * * * * * * * * * * * TEST-4 * * * * * * * * * * * * * * *"
curl -X PUT -b cookies.txt -i $HOST/users -d "email=my_email@gmail.com" -d "password=Monkey"

# TEST-5 > Sign out from the system > Provided that the user is already in the system.
echo -e "\n\n* * * * * * * * * * * * * * * TEST-5 * * * * * * * * * * * * * * *"
curl -X DELETE -b cookies.txt -i $HOST/sign_out
> cookies.txt # To Delete the contents of the file.
# rm cookies.txt

# TEST-6 > ...
echo -e "\n\n* * * * * * * * * * * * * * * TEST-6 * * * * * * * * * * * * * * *"