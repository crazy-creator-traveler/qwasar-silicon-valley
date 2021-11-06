=begin
        Main Program Code of the Model-Block

N O T E:
    All necessary info contained in README.md

We are using Engineering + Re-Engineering
=end
require "sqlite3"

EXIT_SUCCESS = 0
EXIT_FAILURE = 1

$db_filename = "my_first_app.db"
$tablename   = "users"

class ConnectionSqlite
    def create_db(db_name)
        db_name.execute <<-SQL 
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

    def db_connection(query)
            @db = SQLite3::Database.open($db_filename) # If this Database doesn't exist > It will be automatically created!
            data = @db.execute(query)
        rescue SQLite3::Exception => error_message
            # puts("ERROR > #{error_message}") 
            self.create_db(@db)
            retry
        ensure
            @db.close # p(@db.closed?) > Returns: True or False
    return data
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
        data = self.all # p(user_info[:email])
            if(data == nil)
                return EXIT_SUCCESS
            else
                data.each do |index|
                    # p(index[:email])
                    if(user_info[:email] == index[:email])
                        return EXIT_FAILURE
                    end
                end
            return EXIT_SUCCESS
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
            ConnectionSqlite.new.db_connection(query)

            users = self.all
                if(users == nil)
                    result = {:value => false, :description => "ERROR > User wasn't created!\nNOTE: Our Database > Right now completely empty!"}
                return result
                else
                    users.collect do |user|
                        if(user[:email] == user_info[:email])
                            result = {:value => true, :description => "Successfullly created a new user!\n#{user_info}"}
                        return result
                        else
                            result = {:value => false, :description => "ERROR > User wasn't created!"}
                        return result
                        end
                    end
                end
        else
            result = {:value => false, :description => "This user already exists in the Database!\n#{user_info}"}
        return result
        end 
    end

    def get(uniq_user_id)
        query = <<-SQL
                    SELECT * FROM #{$tablename} WHERE id = #{uniq_user_id};
                SQL
        rows = ConnectionSqlite.new.db_connection(query) # p(rows[0]) > 2-Dimensional Array
            if(rows.any?) # any? > ?
                rows = _initialize(rows[0])
            return rows
            else
                return nil
            end
    end

    def all()
        query = <<-SQL
                    SELECT * FROM #{$tablename}
                SQL
        rows = ConnectionSqlite.new.db_connection(query)
            if(rows.any?)
                rows.collect do |index|
                    rows = _initialize(index)
                end # Returns New Array of Hash > rows
            else
                return nil
            end
    end

    def update(uniq_user_id, attributes, value)
        if(self.get(uniq_user_id) == nil)
            result = {:value => false, :description => "User with ID = #{uniq_user_id} > Doesn't exist!"}
        return result
        else
            data = self.get(uniq_user_id)

            query = <<-SQL
                        UPDATE #{$tablename}
                        SET #{attributes} = '#{value}'
                        WHERE 
                            id = #{uniq_user_id}
                    SQL
            ConnectionSqlite.new.db_connection(query)

            if(data[attributes] == value)
                result = {:value => false, :description => "You have added old data for > #{attributes}: #{value}"}
            return result
            else
                result = {:value => true, :description => "Data updated successfully!"}
            return result
            end
        end
    end

    def destroy(uniq_user_id)
        if(self.get(uniq_user_id) == nil)
            result = {:value => false, :description => "User with ID = #{uniq_user_id} > Doesn't exist! There is nothing to delete!"}
        return result
        else
            query = <<-SQL
                        DELETE FROM #{$tablename}
                        WHERE 
                            id = #{uniq_user_id}
                    SQL
            ConnectionSqlite.new.db_connection(query)
            data = self.get(uniq_user_id)
                if(data == nil)
                    result = {:value => true, :description => "User has been successfully deleted!"}
                return result
                else
                    result = {:value => false, :description => "ERROR > User has not been deleted!"}
                return result
                end
        end
    end

    def destroy_all()
        if(self.all == nil)
            result = {:value => false, :description => "Users does't exist! There is nothing to delete!"}
        return result
        else
            query = <<-SQL
                        DELETE FROM #{$tablename}
                    SQL
            ConnectionSqlite.new.db_connection(query)
            data = self.all
                if(data == nil)
                    result = {:value => true, :description => "Users have been deleted successfully!"}
                return result
                else
                    result = {:value => false, :description => "ERROR > Users have not been deleted!" } 
                return result
                end
        end
    end
end