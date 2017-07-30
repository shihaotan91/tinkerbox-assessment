require_relative 'select_item'
require_relative 'find_files'

include FindCSV

def assign_status

  complete = "Mark as complete"
  incomplete = "Mark as incomplete"
  doing = "Mark as doing"

  $status_array = [complete, incomplete, doing]

  def show_array
    puts "Actions\n-------"
    $status_array.each_with_index do |text, i|
      puts "#{i+1}. #{text}"
    end
    puts "Or type 'back' to return to the previous function"
  end

  show_array()

  status = gets.chomp
  status_number = status.to_i

  if (status_number > 0 && status_number <= $status_array.size + 1 )
    system("sed -i '' '#{@selection_number},#{@selection_number} s/$/ [#{$status_array[status_number-1].split.last.capitalize}]/' #{@input}")
  elsif (status == 'back')
    select_item()
  else
    puts "ERROR: Invalid option"
    assign_status()
  end

end
