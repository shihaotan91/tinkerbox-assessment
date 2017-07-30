module FindCSV

  def find_files(file_type)

    puts "Please enter name of #{file_type} file"
    file_name = gets.chomp

    if (File.file?(file_name) && file_type =='input')
      @input = file_name
      return
    elsif (File.file?(file_name) && file_type =='output')
      @output = file_name
      return
    else
      puts "ERROR: File does not exist"
      find_files(file_type)
    end

  end

  def show_input_file()

    puts "Todo list\n-----------"
    system("more -N #{@input}")

  end

end
