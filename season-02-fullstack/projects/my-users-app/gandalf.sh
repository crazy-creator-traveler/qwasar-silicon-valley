# # #
#   Gandalf > For Testing Program Code > app.rb
#
# NOTE:
#   - Command:
#           ./gandalf.sh
#                       ==> To run TESTER
# # #

HOST="localhost:8090/users"

# TEST-1 >  Creating New User
curl -X POST -i $HOST -d "firstname=Luffi" -d "lastname=Monkey" -d "age=22" -d "email=my_email@gmail.com" -d "password=Luffi"

# TEST-2 > Reading All Users-Data
curl -i $HOST

# TEST-3 > ...