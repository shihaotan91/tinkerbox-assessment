require_relative 'find_files'

findInput()

exec("cat #{@input} > #{@output}")
