require_relative 'select_item'

include FindCSV

def add_item

  puts "Enter new to do item"
  new_item = gets.chomp
  system("echo #{new_item} >> #{@input}")
  show_input_file()
  perform_command()

end

def perform_command

  puts "Type 'view' to see current to do list\nType 'add' to add new item to to do list\nType 'end' to copy items from the input file to the output file and exit the system"

  command = gets.chomp.downcase

  if (command == 'view')
    select_item()
  elsif (command == 'add')
    add_item()
  elsif (command == 'end')
    system("cat #{@input} > #{@output}")
  else
    puts "You entered an invalid command"
    perform_command()
  end

end
