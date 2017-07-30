require_relative 'commands'
require './modules/find_files'

include FindCSV

def begin_system()

  find_files('input')
  find_files('output')
  perform_command()

end

begin_system()

puts "Goodbye"
