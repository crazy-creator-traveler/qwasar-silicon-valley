=begin
        Main Program Code of the Model-Block

N O T E:
    All necessary info contained in README.md

We are using Engineering + Re-Engineering
=end
require "sqlite3"

$EXIT_SUCCESS = 0
$EXIT_FAILURE = 1

$db_filename = "db.sql" # Global Variable > We have to clarify about this.
$tablename   = "users"

class ConnectionSqlite
    def new
        @db = nil
    end

    def get_connection
        if(@db == nil)
            @db = SQLite3::Database.new($db_filename)
            create_db
        end
    return @db
    end

    def create_db    
        # Create a table
        rows = self.get_connection().execute <<-SQL 
        CREATE TABLE IF NOT EXISTS #{$tablename} (
            id INTEGER PRIMARY KEY,
            firstname varchar(30), 
            lastname varchar(30),
            age int,
            email varchar(30),
            password varchar(30)
        );
        SQL
    end

    def execute(query)
        # p(query)
        self.get_connection().execute(query)
    end
end

class User
    attr_accessor :id, :firstname, :lastname, :age, :email, :password 

    def _initialize(array)
        @id        = array[0]
        @firstname = array[1]
        @lastname  = array[2]
        @age       = array[3]
        @email     = array[4]
        @password  = array[5]  

        keys = ["id", "firstname", "lastname", "age", "email", "password"]
        keys.zip(array).to_h.transform_keys {|key| key.to_sym}

       # array = "User id: #{@id}, Firstname: #{@firstname}, Lastname: #{@lastname}, Age: #{@age}, Email: #{@email}, Password: #{@password}"
    end

    def check_duplicates(user_info)
        data = self.all # p(user_info[:email]); puts # p(data)
            if(data == nil)
                return $EXIT_SUCCESS
            else
                data.collect do |index|
                    # p(index[:email])
                    if(user_info[:email] == index[:email])
                        return $EXIT_FAILURE
                    end
                end
                return $EXIT_SUCCESS    
            end
    end

    def create(user_info) # id > Является уникальным он автоматически будет добавлен === 1  > И т.д. 
        if(check_duplicates(user_info) == 0)
            query = <<-SQL
                    INSERT INTO #{$tablename} (firstname, lastname, age, email, password) 
                    VALUES (
                            "#{user_info[:firstname]}",
                            "#{user_info[:lastname]}",
                            "#{user_info[:age]}",
                            "#{user_info[:email]}",
                            "#{user_info[:password]}"
                        );
                    SQL
            # puts query
            data = ConnectionSqlite.new.execute(query)
                if(data.class == Array)
                    puts("Successfullly created new user!\n#{user_info}")
                else
                    puts("ERROR > User wasn't created !")
                end
        else
            puts("This user already exists in the Database!\n#{user_info}")
        end 
    end

    def get(uniq_user_id)
        query = <<-SQL
                    SELECT * FROM #{$tablename} WHERE id = #{uniq_user_id};
                SQL
        # p(query)
        rows = ConnectionSqlite.new.execute(query) # p(rows[0])
            if(rows.any?) # any? > ?
                rows = _initialize(rows[0])
            else
                # puts("User with ID = #{uniq_user_id} > Doesn't exist !")
                return nil
            end
    end

    def all
        query = <<-SQL
                    SELECT * FROM #{$tablename}
                SQL

        rows = ConnectionSqlite.new.execute(query) # p(rows)
            if(rows.any?)
                rows.collect do |index|
                    rows = _initialize(index)
                end
            else
                # puts("Users Doesn't exist !")
                return nil
            end
    end

    def update(uniq_user_id, attributes, value)
        if(self.get(uniq_user_id) == nil)
            puts("User with ID = #{uniq_user_id} > Doesn't exist !")
            return nil
        else
            data = self.get(uniq_user_id)

            query = <<-SQL
                        UPDATE #{$tablename}
                        SET #{attributes} = '#{value}'
                        WHERE 
                            id = #{uniq_user_id}
                    SQL
            # puts query
            ConnectionSqlite.new.execute(query)

            if(data[attributes] == value)
                puts("You have added old data for > #{attributes}: #{value}")
            else
                puts("Data updated successfully!")
            end
        end
    end

    def destroy(uniq_user_id)
        if(self.get(uniq_user_id) == nil)
            puts("User with ID = #{uniq_user_id} > Doesn't exist! There is nothing to delete !")
            return nil
        else
            query = <<-SQL
                        DELETE FROM #{$tablename}
                        WHERE 
                            id = #{uniq_user_id}
                    SQL
            ConnectionSqlite.new.execute(query)
            data = self.get(uniq_user_id)
            if(data == nil)
                puts("User has been successfully deleted!")
                return nil
            else
                puts("ERROR > User has not been deleted!")
            end
        end
    end

    def destroy_all
        if(self.all == nil)
            puts("Users does't exist! There is nothing to delete !")
        else
            query = <<-SQL
                        DELETE FROM #{$tablename}
                    SQL
            ConnectionSqlite.new.execute(query)
            data = self.all
                if(data == nil)
                    puts("Users have been deleted successfully!")
                    return nil
                else
                    puts("ERROR > Users have not been deleted!!")
                end
        end
    end
end