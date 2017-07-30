require_relative 'commands'
require_relative 'select_item'

include FindCSV

find_files('input')
find_files('output')
perform_command()
puts "Goodbye"
