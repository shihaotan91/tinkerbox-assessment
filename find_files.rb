def find_input
  puts 'Please enter name of input file'
  @input = gets.chomp.downcase

  if (File.file?(@input))
    find_output()
  else
    puts "ERROR: File does not exist"
    find_input()
  end

end

def find_output
  puts 'Please enter name of output file'
  @output = gets.chomp.downcase

  if (File.file?(@output))
    return
  else
    puts "ERROR: File does not exist"
    find_output()
  end
end
