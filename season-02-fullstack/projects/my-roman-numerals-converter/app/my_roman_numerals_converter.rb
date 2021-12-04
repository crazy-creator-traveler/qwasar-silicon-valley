=begin
    Main Program Code
    
NOTE:
    All necessary info contained in README.md
=end

# Helper method to return roman equivalent of numbers with 1 digit
def roman_unit(num)
    unit = ''
    case num
    when 0..3
        unit += ("I" * num)
    when 4
        unit += "IV"
    when 5
        unit += "V"
    when 6..8
        unit += "V" + ("I" * (num-5))
    when 9
        unit += "IX"
    end
    return unit
end

# Helper method to return roman equivalent of numbers with 2 digits
def roman_tens(str_num)
    str_num = str_num.to_s
    tens = ''
    ten = str_num[0].to_i
    unit = str_num[1].to_i
    case ten
    when 0..3
        tens += ("X" * ten).to_s + roman_unit(unit)
    when 4
        tens += "XL" + roman_unit(unit)
    when 5
        tens += "L" + roman_unit(unit)
    when 6..8
        tens += "L" + ("X" * (ten-5)) + roman_unit(unit)
    when 9
        tens += "XC" + roman_unit(unit)
    end
    return tens
end

# Helper method to return roman equivalent of numbers with 3 digits
def roman_hundred(str_num)
    str_num = str_num.to_s
    hundred = ''
    hund = str_num[0].to_i
    tens = str_num[1..-1]
    case hund
    when 0..3
        hundred += ("C" * hund) + roman_tens(tens)
    when 4
        hundred += "CD" + roman_tens(tens)
    when 5
        hundred += "D" + roman_tens(tens)
    when 6..8
        hundred += "D" + ("C" * (hund-5)) + roman_tens(tens)
    when 9
        hundred += "CM" + roman_tens(tens)
    end
    return hundred
end

# Helper method to return roman equivalent of numbers with 4 digits
def roman_thousand(num)
    thousand = ''
    thousand_str = num.to_s
    thousand_num = thousand_str[0].to_i
    hundred = thousand_str[1..-1]
    case thousand_num
    when 0..3
        thousand += ("M" * thousand_num) + roman_hundred(hundred)
    else
        thousand = "Invliad number, please enter number from 1 - 3000"
    end 
    return thousand
end

def my_roman_numerals_converter(number)
    if(number.class == Integer) 
        num_lenght = number.to_s.length # calculate the length of number
        roman = ''
        case num_lenght 
        when 1  # if length is 1
            roman = roman_unit(number) 
        when 2  # if length is 2
            roman = roman_tens(number)
        when 3  # if length is 3 
            roman = roman_hundred(number) 
        when 4  # if length is 4
            roman = roman_thousand(number) 
        else    # if length is grather than 4
            roman = "Invliad number, please enter number from 1 - 3000" # return an invalid message
        end
        return roman
    else
        return "Invalid data! Please enter a number in an integer data type from 1 - 3000"
    end
end