require_relative 'find_files'

def do_action

  puts "Type 'view' to see current input to do list"

  action = gets.chomp.downcase

  if (action == 'view')
    puts "\nTodo list\n-----------\n"
    system("more -N #{@input}")
    do_action()
  else
    puts "You entered an invalid command"
    do_action()
  end

end
