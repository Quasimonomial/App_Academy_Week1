


def file_shuffler
  
  file_name = prompt
  new_lines = shuffle_file(file_name)
 
  output_file(new_lines, file_name)

end

def output_file content, file_in
   fileout_name = "#{file_in}-shuffled.txt"
   out_file = File.open(fileout_name, "w")
   
   content.each do |line|
     line.chomp
     out_file.puts(line)
   end
   
   out_file.close
end

def prompt
  puts "What file would you like to open?"
  gets.chomp
end

def shuffle_file file
  contents = File.readlines(file)
  contents.shuffle
end

if $PROGRAM_NAME == __FILE__
  file_shuffler
end