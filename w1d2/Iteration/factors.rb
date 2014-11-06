def factors number
  factors = []
  root = Math.sqrt(number).to_i + 1
  
  (1..root).each do |x|
    if number % x == 0
      factors << x
      factors << number/x
    end
  end
  factors.sort
end

if $PROGRAM_NAME == __FILE__
  print factors 3454346
  print factors 8
  print factors 124
  print factors 7
end