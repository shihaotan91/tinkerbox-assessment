require 'csv'
require_relative 'commands'
require_relative 'statuses'

include FindCSV

def select_item

  show_input_file()

  puts "Select a valid item number from the todo list\nOr type 'back' to return to the previous function"

  selection = gets.chomp
  @selection_number = selection.to_i

  if(@selection_number > 0 && @selection_number <= CSV.read(@input).count)
    print "#{@selection_number}. "
    system("sed -n '#{@selection_number},#{@selection_number} p' #{@input}")
    assign_status()
    select_item()
  elsif(selection == 'back')
    perform_command()
  else
    puts "Please input a valid Integer"
    select_item()
  end

end
