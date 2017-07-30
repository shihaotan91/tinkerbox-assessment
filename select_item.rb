require 'csv'
require_relative 'commands'
require './modules/actions'

include FindCSV
include Actions

def select_item

  show_input_file()

  puts "Select a valid item number from the todo list\nOr type 'back' to return to the previous function"

  selection = gets.chomp.downcase
  @selection_number = selection.to_i

  if(@selection_number > 0 && @selection_number <= CSV.read(@input).count)
    show_selection()
    perform_action()
    select_item()
  elsif(selection == 'back')
    perform_command()
  else
    puts "Please input a valid Integer"
    select_item()
  end

end
