def num_to_s value, base
  hash = { 0 => "0", 
    1=> "1", 2=> "2", 3=> "3", 4=> "4", 5=> "5", 6=> "6", 7=> "7", 8=> "8",
     9=> "9", 10=> "A", 11=> "B", 12=> "C", 13=> "D", 14=> "E", 15=> "F" }
  
  working_part = value
  result = ""
  while working_part > 0
    result += hash[(working_part % base)]  
    working_part /= base
  end
  return result.reverse
end