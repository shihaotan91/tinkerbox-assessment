require_relative 'commands'
require './modules/find_files'

include FindCSV

find_files('input')
find_files('output')
perform_command()
puts "Goodbye"
