require 'csv'
require_relative 'actions'
require_relative 'statuses'

include FindCSV

def select_item

  show_input_file()

  puts "Select a valid item number from the todo list\nOr select 0 to return to the previous function"

  @selection = gets.chomp.to_i

  if(@selection > 0 && @selection <= CSV.read(@input).count)
    print "#{@selection}. "
    system("sed -n '#{@selection},#{@selection} p' #{@input}")
    assign_status()
    select_item()
  elsif(@selection == 0)
    do_action()
  else
    puts "Please input a valid Integer"
    select_item()
  end

end
