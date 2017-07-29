def findInput
  puts 'Please enter name of input file'
  @input = gets.chomp

  if (File.file?(@input))
    findOutput()
  else
    puts "ERROR: File does not exist"
    findInput()
  end
end

def findOutput
  puts 'Please enter name of output file'
  @output = gets.chomp

  if (File.file?(@output))
    puts "Copying contents of input into output"
  else
    puts "ERROR: File does not exist"
    findOutput()
  end
end
