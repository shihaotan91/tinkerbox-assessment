require_relative '../select_item'
require_relative 'find_files'

include FindCSV

module Actions

  COMPLETE = "Mark as complete"
  INCOMPLETE = "Mark as incomplete"
  DOING = "Mark as doing"

  @@actions_array = [COMPLETE, INCOMPLETE, DOING]

  def show_actions

    puts "Actions\n-------"
    @@actions_array.each_with_index do |text, i|
      puts "#{i+1}. #{text}"
    end
    puts "Type 'delete' to delete selected item"
    puts "Or type 'back' to return to the previous function"

  end

  def assign_status
    system("sed -i '' '#{@selection_number},#{@selection_number} s/$/ [#{@@actions_array[@@action_number-1].split.last.capitalize}]/' #{@input}")
  end

  def delete_item
    system("sed -i '' #{@selection_number}d #{@input}")
    puts "Item #{@selection_number} deleted"
  end

  def perform_action

    show_actions()

    action = gets.chomp.downcase
    @@action_number = action.to_i

    if (@@action_number > 0 && @@action_number <= @@actions_array.size + 1 )
      assign_status()
    elsif (action == 'delete')
      delete_item()
    elsif (action == 'back')
      select_item()
    else
      puts "ERROR: Invalid option"
      perform_action()
    end

  end

end
