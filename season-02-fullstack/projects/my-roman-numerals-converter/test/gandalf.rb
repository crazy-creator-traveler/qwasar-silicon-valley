=begin
        Gandalf > For Testing Main Program Code
=end

require "../app/my_roman_numerals_converter.rb"

EXIT_SUCCESS = 0
EXIT_FAILURE = 1

def gandalf(data, expected_data)
    if(data === expected_data)
        puts("Result correct > #{data}")
    return EXIT_SUCCESS
    else
        puts("* * * Result Not-Correct > #{data}! * * *")
    return EXIT_FAILURE
    end
end

def main()
    number_1 = 14;    expected_data_1 = "XIV"
    number_2 = 79;    expected_data_2 = "LXXIX"
    number_3 = 845;   expected_data_3 = "DCCCXLV"
    number_4 = 2022;  expected_data_4 = "MMXXII"
    
    number_5 = 000;   expected_data_5 = ""
    number_6 = 01;    expected_data_6 = "I"
    number_7 = 007;   expected_data_7 = "VII"
    number_8 = 7777;  expected_data_8 = "Invliad number, please enter number from 1 - 3000" # or VMMDCCLXXVII
    number_9 = 3000;  expected_data_9 = "MMM"
    number_10 = "ad"; expected_data_10 = "Invalid data! Please enter a number in an integer data type from 1 - 3000"

    gandalf(my_roman_numerals_converter(number_1), expected_data_1)
    gandalf(my_roman_numerals_converter(number_2), expected_data_2)
    gandalf(my_roman_numerals_converter(number_3), expected_data_3)
    gandalf(my_roman_numerals_converter(number_4), expected_data_4)
    gandalf(my_roman_numerals_converter(number_5), expected_data_5)
    gandalf(my_roman_numerals_converter(number_6), expected_data_6)
    gandalf(my_roman_numerals_converter(number_7), expected_data_7)
    gandalf(my_roman_numerals_converter(number_8), expected_data_8)
    gandalf(my_roman_numerals_converter(number_9), expected_data_9)
    gandalf(my_roman_numerals_converter(number_10), expected_data_10)

return EXIT_SUCCESS
end

main()