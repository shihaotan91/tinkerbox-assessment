require_relative 'select_item'

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
    puts "Or select 0 to return to the previous function"
  end

  show_array()

  status = gets.chomp.to_i

  if (status > 0 && status <= $status_array.size + 1 )
    system("sed -i '' '#{@selection},#{@selection} s/$/ [#{$status_array[status-1].split.last.capitalize}]/' #{@input}")
  elsif (status == 0)
    select_item()
  else
    puts "ERROR: Invalid option"
    assign_status()
  end

end
