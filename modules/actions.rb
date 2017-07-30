require_relative '../select_item'
require_relative 'find_files'

include FindCSV

module Actions

  complete = "Mark as complete"
  incomplete = "Mark as incomplete"
  doing = "Mark as doing"

  $actions_array = [complete, incomplete, doing]

  def show_actions

    puts "Actions\n-------"
    $actions_array.each_with_index do |text, i|
      puts "#{i+1}. #{text}"
    end
    puts "Type 'delete' to delete selected item"
    puts "Or type 'back' to return to the previous function"

  end

  def perform_action

    show_actions()

    action = gets.chomp.downcase
    action_number = action.to_i

    if (action_number > 0 && action_number <= $actions_array.size + 1 )
      system("sed -i '' '#{@selection_number},#{@selection_number} s/$/ [#{$actions_array[action_number-1].split.last.capitalize}]/' #{@input}")
    elsif (action == 'delete')
      system("sed -i '' #{@selection_number}d #{@input}")
      puts "Item #{@selection_number} deleted"
    elsif (action == 'back')
      select_item()
    else
      puts "ERROR: Invalid option"
      perform_action()
    end

  end

end
