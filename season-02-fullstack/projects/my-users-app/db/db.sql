/* To create Database */
CREATE TABLE IF NOT EXISTS users(
                                    id INTEGER PRIMARY KEY,
                                    firstname varchar(30), 
                                    lastname varchar(30),
                                    age int,
                                    email varchar(30),
                                    password varchar(30)
                                );