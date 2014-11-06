def super_print string, options = {}
  default = {
    :times => 1 ,
    :upcase => false,
    :reverse => false
  }
  options = default.merge(options)
  
  if options[:upcase]
    string.upcase!
  end
  if options[:reverse]
    string.reverse!
  end
  print string * options[:times]
end


if $PROGRAM_NAME == __FILE__
  super_print("Hello")                                    #=> "Hello"
  super_print("Hello", :times => 3)                       #=> "Hello" 3x
  super_print("Hello", :upcase => true)                   #=> "HELLO"
  super_print("Hello", :upcase => true, :reverse => true) #=> "OLLEH"
end