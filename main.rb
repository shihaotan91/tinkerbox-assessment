def findInput
  puts 'Please enter name of input file'
  input = gets.chomp

  if (File.file?(input))
    puts "Found"
  else
    puts "ERROR: File does not exist"
    findInput()
  end
end

findInput()
