def substrings string
  substrings = []
  pos1 = 0
  pos2 = 0
  while pos1 < string.length
    while pos2 < string.length
      substrings << string[pos1..pos2]
      pos2 += 1
    end
    pos1 += 1
    pos2 = pos1
  end
  
  substrings.uniq
end

# print substrings("stuff")

def is_word? str
  File.foreach("dictionary.txt") do |line|
    #puts line.chomp
    return true if line.chomp == str  
  end
  
  false
end

def subwords string
  substring_list = substrings(string)
  result = []
  substring_list.each do |str|
    if is_word?(str)
      print str
      result << str 
    end
  end
  
  result
end

if $PROGRAMNAME == __FILE__
  p subwords('theifsd')
end
