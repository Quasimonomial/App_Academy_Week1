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
  
  
  def in_words
    return "zero" if self == 0 #special case for zero
    working = self
    
    trillions = working/1000000000000
    
    working = working % 1000000000000
    
    trillions_place = ''
    trillions_place = parse_triplet(trillions) + " trillion " if trillions > 0
    
    billions = working/ 1000000000
    
    working = working % 1000000000
    
    billions_place = ''
    billions_place = parse_triplet(billions) + " billion " if billions > 0
    
    
    millions = working / 1000000
    
    working = working % 1000000
    
    millions_place = ''
    millions_place = parse_triplet(millions) + " million " if millions > 0
    
  
    thousands = working/1000
    
    working = working % 1000
    
    thousands_place = ''
    thousands_place = parse_triplet(thousands) + " thousand " if thousands > 0
    
    
    
    words = trillions_place + billions_place + millions_place + thousands_place + parse_triplet(working)
    words = words.strip
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