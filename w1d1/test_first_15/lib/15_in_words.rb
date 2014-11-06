class Fixnum
  ONES_PLACE = {
    0 => "",
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine"
  }
  TEN_TO_NINETEEN = {
    10 => "ten",
    11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    14 => "fourteen",
    15 => "fifteen",
    16 => "sixteen",
    17 => "seventeen",
    18 => "eighteen",
    19 => "nineteen"
  }
  TENS_PLACE = {
    0  => '',
    2  => "twenty",
    3  => "thirty",
    4  => "forty",
    5  => "fifty",
    6  => "sixty",
    7  => "seventy",
    8  => "eighty",
    9  => "ninety"
  }
  BIG_NUMS = [ [" trillion ", 1000000000000],
                [" billion ", 1000000000],
                [" million ", 1000000],
                [" thousand ", 1000] ]
  
  def in_words
    return "zero" if self == 0 #special case for zero
    working = self
    total_word = ''

    BIG_NUMS.each do |cycle|
      place = cycle[0]
      num = cycle[1]

      place_triplet = working/num
      working = working % num

      total_word += parse_triplet(place_triplet) + place if place_triplet > 0 
    end

    words = total_word + parse_triplet(working)
    return words.split.join(" ")
  end
  
  def parse_triplet num
    ones = num % 10
    tens = (num % 100)/10
    hundreds = num/100
    
    if hundreds != 0
      hundreds_place = ONES_PLACE[hundreds] + " hundred"
    else
      hundreds_place = ''
    end
    
    if 9 < (num % 100) && (num % 100) < 20
      trailing = num - 100 * hundreds
      words = hundreds_place + " " + TEN_TO_NINETEEN[trailing]
      words = words.strip
      return words
    end
    


    words = hundreds_place + " " + TENS_PLACE[tens] + " " + ONES_PLACE[ones]
    words.strip!
    return words
  end
end