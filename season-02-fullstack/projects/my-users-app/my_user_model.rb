=begin
        Main Program Code

N O T E:
    All necessary info contained in README.md

We are using Engineering + Re-Engineering
=end
require "sqlite3"

$db_filename = "db.sql" # Global Variable > We have to clarify about this.
$tablename   = "users"

class ConnectionSqlite
    def new
        @db = nil
    end

    def get_connection
        if @db == nil
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
        
        array = "User id: #{@id}, Firstname: #{@firstname}, Lastname: #{@lastname}, Age: #{@age}, Email: #{@email}, Password: #{@password}"
    end
    
    def create(user_info) # id > Является уникальным он автоматически будет добавлен === 1  > И т.д. 
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
        ConnectionSqlite.new.execute(query)
         
    # return uniq_user_id # In INTEGER Data-Type  
    end

    def get(uniq_user_id)
        query = <<-SQL
                    SELECT * FROM #{$tablename} WHERE id = #{uniq_user_id};
                SQL
        # p(query)
        rows = ConnectionSqlite.new.execute(query)
       # p(rows[0])
        if(rows.any?) # any? > ?
               rows = _initialize(rows[0])
        else
           nil
        end
    
    # return # All info about > USER
    end

    def all
        query = <<-SQL
                    SELECT * FROM #{$tablename}
                SQL

        rows = ConnectionSqlite.new.execute(query) # p(rows)
        # p(rows)
            if(rows.any?)
                rows.collect do |index|
                    rows = _initialize(index)
                end
            else
                nil
            end
    # return # Hash of USERS
    end

    def update(uniq_user_id, attributes, value)
        query = <<-SQL
                    UPDATE #{$tablename}
                    SET #{attributes} = '#{value}'
                    WHERE 
                        id = #{uniq_user_id}
                SQL
        # puts query
        ConnectionSqlite.new.execute(query)
    # return # Hash of USER
    end

    def destroy(uniq_user_id)
        query = <<-SQL
                    DELETE FROM #{$tablename}
                    WHERE 
                        id = #{uniq_user_id}
                SQL
        ConnectionSqlite.new.execute(query)
    # return # The Updated DATABASE
    end

    def destroy_all
        query = <<-SQL
                    DELETE FROM #{$tablename}
                SQL
        ConnectionSqlite.new.execute(query)
    end
end