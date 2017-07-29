require 'csv'
require_relative 'find_files'
require_relative 'actions'

def select_item

  complete = "1. Mark as complete"
  incomplete = "2. Mark as incomplete"
  doing = "3. Mark as doing"

  status_array = [complete, incomplete, doing]

  puts "Select a valid item number from the todo list"

  selection = gets.chomp.to_i

  if(selection > 0 && selection <= CSV.read(@input).count)
    system("sed -n '#{selection},#{selection} p' #{@input}")
    puts "Actions\n-----\n"
    puts status_array
    puts "Type 'back' to return to previous function"
    selection_action = gets.chomp
    if (selection_action == 'back')
      do_action()
    else
      select_item()
    end
  else
    puts "Please input a valid Integer"
    select_item()
  end

end
