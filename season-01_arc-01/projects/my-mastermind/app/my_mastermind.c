/*
**
    Main Program Code
**
*/
#include "library.h"

int main(int sum, char** data)
{
    if(sum < 2)
    { // The Game > Starts with default settings...
        int secret_code[SECRET_CODE_LEN];
        random_generator(secret_code);     
        introduction_by_default_settings(secret_code, DEFAULT_ATTEMPTS);
        mastermind(secret_code, DEFAULT_ATTEMPTS);
    return EXIT_SUCCESS;
    }
    else if(sum == 3)
    { // The Game > Start with user settings... 
        int secret_code[SECRET_CODE_LEN]; int attempts = 0; int result;

        result = user_setting(sum, data, secret_code, attempts);
            if(result == -1)
            {
                introduction_by_user_settings(secret_code, DEFAULT_ATTEMPTS, result);
                mastermind(secret_code, DEFAULT_ATTEMPTS);
            return EXIT_SUCCESS;
            }
            else if(result >= 1) 
            { 
                attempts = result;
                random_generator(secret_code);   
                introduction_by_user_settings(secret_code, attempts, result);
                mastermind(secret_code, attempts);
            return EXIT_SUCCESS;
            }
    return EXIT_SUCCESS;
    }
    else if(sum >= 2)
    {
        printf("Error > The wrong way to set the settings for the Game!\n");
    return EXIT_SUCCESS;
    };
return EXIT_SUCCESS; 
};