require_relative 'find_files'
require_relative 'select_item'

include FindCSV

def do_action

  puts "Type 'view' to see current to do list\nType 'add' to add new item to to do list\nType 'end' to copy items from the input file to the output file and exit the system"

  action = gets.chomp.downcase

  if (action == 'view')
    select_item()
  elsif (action == 'add')
    puts "Enter new to do item"
    new_item = gets.chomp
    system("echo #{new_item} >> #{@input}")
    show_input_file()
    do_action()
  elsif (action == 'end')
    system("cat #{@input} > #{@output}")
    return
  else
    puts "You entered an invalid command"
    do_action()
  end

end
