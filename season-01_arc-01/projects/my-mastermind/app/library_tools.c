/*
**
    Here > We contain:
         1) Our Functions() with Code

NOTE:
    Here we also include > "library.h"
            ==> So that no matter where Functions()
                ==> There is no Error > "Implicit Declaration of Function()"
**
*/
#include "library.h"

//
// Main Functions()
//
void introduction_by_default_settings(int* secret_code, int attempts)
{
    printf("* * * Welcome to our Game Mastermind ! * * *\n");
    printf("NOTE:\nSecret Code & Attempts > Will be installed by default\n");
    printf("- - - - -\n");
    printf("Secret Code: ");
    int count;
        for(count = 0; count < SECRET_CODE_LEN; count++)
        {
           printf("%d", secret_code[count]); 
        }; 
    printf("\nAttempts: %d\n", attempts);
    printf("Good luck CodeBreaker > In finding the Secret Code\n");
};

void introduction_by_user_settings(int* secret_code, int attempts, int flag) //  bool flag_c, bool flag_t  > If we use this method > We got Error > Segment Core Dump!
{
    printf("* * * Welcome to our Game Mastermind ! * * *\n");
    if(flag == -1)
    {
        printf("NOTE:\nAttempts > Will be installed by default\n");
    }
    else if(flag >= 1)
    {
        printf("NOTE:\nSecret Code > Will be installed by default\n");
    };
    printf("- - - - -\n");
    printf("Secret Code: ");
    int count;
        for(count = 0; count < SECRET_CODE_LEN; count++)
        {
           printf("%d", secret_code[count]); 
        }; 
    printf("\nAttempts: %d\n", attempts);
    printf("Good luck CodeBreaker > In finding the Secret Code\n");
};

int mastermind(int* secret_code, int attempts)
{ 
    int main_count;
        for(main_count = 0; main_count < attempts; main_count++)
        {  
            if(main_count <= attempts-1) { printf("\n- - - - -\nROUND: %d\n- - - - -\n", main_count); };
            char buf[100]; //printf("User Input: %s",buf);
            int size = read(0, buf, 100); 
            bool result_1;
                if(size == 5)
                {   
                    result_1 = checker_1(buf);
                        if(result_1)
                        {
                            printf("DETAILS: \n");
                            int code_breaker[SECRET_CODE_LEN];
                            code_breaker_transform(buf, code_breaker);

                            int result_2 = checker_2(secret_code, code_breaker);
                                if(result_2 == 0) { return EXIT_SUCCESS; };
                        };
                }
                else if(size != 5)
                { //  printf("size > %d\n", size);
                    printf("DETAILS: \nWrong Input > Value must be 4 digits !\n");
                };

            memset(buf, 0, sizeof(buf));

            if(main_count == attempts-1)
            { 
                printf("Game Over !\nCome play again, next time you can win !\n");
            return EXIT_SUCCESS;
            };
        };
return EXIT_SUCCESS;
};

int* random_generator(int* secret_code_)
{
    srand(time(0)); // Use current time as seed for random generator
    int random_number;
    int count;
        for(count = 0; count <= SECRET_CODE_LEN-1; count++)
        {                
            do  {
                random_number =(rand() % 7 + 1);
                secret_code_[count] = random_number;
                } while(secret_code_[0] == secret_code_[1] || secret_code_[0] == secret_code_[2] || secret_code_[0] == secret_code_[3] ||
                        secret_code_[1] == secret_code_[2] || secret_code_[1] == secret_code_[3] ||
                        secret_code_[2] == secret_code_[3]); // printf("%d", secret_code_[count]);
        };
return secret_code_;
};

int user_setting(int sum, char** data, int* secret_code, int attempts) //  return -1 (it means flag_C)  OR  return > 0  (it means flag_T)
{
    int count;
        for(count = 1; count < sum; count++)
        {
            char* flag_c = "-c";
            char* flag_t = "-t";

            if(my_strcmp(data[count], flag_c) == 0)
            { //    printf("It is > Flag %s\n", data[count]);  
                int size = strlen(data[2]);
                    if(size == 4)
                    {
                        bool result;
                        char* buf = data[2];
                        result = checker_1(buf);
                            if(result)
                            { 
                              secret_code_transform(data, secret_code);
                            return -1; //flag_C = true;
                            }
                            else{ return EXIT_SUCCESS; };
                    }       
                    else if(size != 4)
                    {
                        printf("DETAILS: \nWrong Input > Value must be 4 digits!\n");              
                    return EXIT_SUCCESS;
                    };
            }
            else if(my_strcmp(data[count], flag_t) == 0)
            { //    printf("It is > Flag %s\n", data[count]);
                int size = my_strlen(data[2]);
                    if( size > 0 && size <= 2)
                    {
                        char* buf = data[2];
                        int number = atoi(buf);
                            if(number == 0 || buf[1] > 57 || 
                              (buf[1] >= 32 && buf[1] <= 47))
                            {
                                printf("DETAILS: \nWrong input > Value must be only digits!\n");
                            return EXIT_SUCCESS;
                            }
                            else{ 
                                    attempts = atoi(data[2]);                                                                                   
                                return attempts; //flag_T = true;
                                }
                    }
                    else{
                            printf("DETAILS: \nWrong Input > Attempts can be from 1-99 !\n");       
                        return EXIT_SUCCESS;
                        }
            }
            else{
                    printf("Error > You provided not correct Flag!\nYou can use Flag: -c  or  -t\n");
                return EXIT_SUCCESS;
                }  
        };
return EXIT_SUCCESS;
};

int* secret_code_transform(char** buf, int* secret_code)
{
    char transform[1];
    int count;
        for(count = 0; count < SECRET_CODE_LEN; count++)
        {
            *transform = buf[2][count];
            secret_code[count] = atoi(transform);
        };
return secret_code;
};

int* code_breaker_transform(char* buf, int* code_breaker)
{
    char transform[1];
    int count; 
        for(count = 0; count < SECRET_CODE_LEN; count++)
        { 
            *transform = buf[count]; // *transform > Starts linking from 0-.. ; &buf[count] > Starts linking from ..-0;
            code_breaker[count] = atoi(transform);
        };
return code_breaker;
};

bool checker_1(char* buf)// correctness checker()
{
    int number = atoi(buf);
        if(number <= 77 || buf[0] > 55 || buf[1] > 55 || buf[2] > 55 || buf[3] > 55 ||
          (buf[3] >= 32 && buf[3] <= 47))
        { 
             printf("DETAILS: \nWrong input > Value must be only digits from 0-7!\n");
        return false;
        } 
        else if(buf[0] == buf[1] || buf[0] == buf[2] || buf[0] == buf[3] ||
                buf[1] == buf[2] || buf[1] == buf[3] ||                     
                buf[2] == buf[3])
        {
            printf("DETAILS: \nWrong input > Value of digits must be different!\n");
        return false;
        }
        else{
                return true;
            };    
};

int checker_2(int* secret_code, int* code_breaker) // compliance checker()
{
    int well_placed = 0;
    int mis_placed  = 0;
    int count; 
        for(count = 0; count <= SECRET_CODE_LEN-1; count++)
        {
            if(secret_code[count] == code_breaker[count])
            { 
                well_placed++;
            }
            else if(secret_code[count] != code_breaker[count])
            {
                int count_1;
                    for(count_1 = 0; count_1 <= SECRET_CODE_LEN-1; count_1++)
                    { //printf("secret > %d\n", secret_code[count]);                                            
                        if(code_breaker[count] == secret_code[count_1])
                        {
                            mis_placed++;
                            continue;
                        };
                    }     
            }; 
        };
    if(well_placed == 4)
    {
        printf("Congratz! You did it !\n");
    return EXIT_SUCCESS;
    }
    else if(well_placed != 4)
    { 
        printf("Well placed pieces : %d\n", well_placed);
        printf("Misplaced pieces   : %d\n", mis_placed); // These are the numbers that exist > But not in the correct place!
                                                         // If numbers > Generally others > Then they are not added.
    };
return 1;
};

//
// Additional Functions()
//
int my_strlen(char* string)
{
    int result = 0;
    int s;
        for(s = 0; string[s] != 0; s++)
        {
            result++;
        };
return result;
};

int my_strcmp(char* param_1, char* param_2) 
{
    int result;
    int len_1 = my_strlen(param_1);
    int len_2 = my_strlen(param_2);
        if( len_1 == 0 && len_2 == 0){ return 0; }
        else if(len_1 == 0 || len_1 < len_2){ return -1; }
        else if(len_2 == 0 || len_1 > len_2){ return  1; };

    int index;
        for(index = 0; index < len_1; index++) 
        {   
            if(param_1[index] == param_2[index]){ result = 0; }
            else if(param_1[index] != param_2[index])
            { 
                result = param_1[index] - param_2[index];  
                    if(result < 0){ result = -1; }
                    if(result > 0){ result =  1; }
            return result;
            };
        }
return result;
};