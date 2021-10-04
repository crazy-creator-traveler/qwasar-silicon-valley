# PROJECT My_User_App
Have to:
    
    1) Contains > CLASS User with Methods such as:
        I. create()
                ==> Have to:
                        
                        1) Takes as INPUT > USER INFO which contained:
                                                                - firstname
                                                                - lastname
                                                                - age
                                                                - password
                                                                - email
                
                        2) CREATES > a NEW USER.
                    
                        3) Return as OUTPUT > A Uniq USER ID > In The POSITIVE INTEGER-Data Type.

        II. get()
                ==> Have to:
                        1) Takes as INPUT > USER ID.
                        
                        2) ...

                        3) Returns as OUTPUT > All information about USER 
                                                            ==> Which contained in the DATABASE.
                    
        III. all
                ==> Have to:
                        1) Takes as INPUT > All USERS ID

                        2) ...

                        3) Returns as OUTPUT > Hash of USERS.

        IV. update()
                ==> Have to:
                        1) Takes as INPUT > 3-ARGUMENTS :
                                                    - User ID
                                                    - Attributes
                                                    - Value

                        2) Updates > ...

                        3) Returns as OUTPUT > Hash of USER.

        V. destroy()
                ==> Have to:
                        1) Takes as INPUT > User ID.

                        2) Deletes all Data of this User > From the DATABASE.

                        3) Returns as OUTPUT > The Updated DATABASE.
* * *
    * * *
* * *
    2)


# We will use Technology|Pattern in software design  >  MVC | MODEL VIEW CONTROLER
1) MODEL
        ==> Это грубыми словами База Данных
        
        ==> Отвечает за данные приложения

        ==> Свою очередю это :
                        - База Данных

                        - И скрипты на SQL > Которую Создают-Данные | Обновляют-Данные | Удаляют-Данные. 

2) VIEW
        ==> Это грубыми словами HTML-разметка.
        
        ==> Отвечает за внешний вид

3) CONTOLER
        ==> Это грубыми словами Основная Логика. 
            ==> В нашем случае app.rb
        
        ==> Контролирует работу приложения

# Lust Update: 22:26  16/09/2021