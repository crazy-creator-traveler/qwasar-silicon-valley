/*
**
    Here > We contain :
        1) The Name and Arguments of the Functions().
        2) C-Libraries
        3) Some predefined Arguments
                                            ==> That we use for the Program My_Mastermind
**
*/
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>  // To use EXIT_SUCCESS;
#include <string.h>
#include <time.h>    // To use Function time()
#include <unistd.h>

#ifndef LIBRARY_TOOLS
#define LIBRARY_TOOLS
// Main Functions()
    void introduction_by_default_settings(int* secret_code, int attempts);
    void introduction_by_user_settings(int* secret_code, int attempts, int flag);

    int mastermind(int* secret_code, int attempts);
    int* random_generator(int* secret_code_);
    int user_setting(int sum, char** data, int* secret_code, int attempts);

    int* code_breaker_transform(char* buf, int* code_breaker);
    int* secret_code_transform(char** buf, int* secret_code);
    
    bool checker_1(char* buf);
    int  checker_2(int* secret_code, int* code_breaker);

// Additional Functions()
    int my_strlen(char* string);
    int my_strcmp(char* param_1, char* param_2);
#endif

#ifndef SECRET_CODE_LEN
    #define SECRET_CODE_LEN 4
    #define DEFAULT_ATTEMPTS 10
#endif