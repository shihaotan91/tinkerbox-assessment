require_relative 'actions'

include FindCSV

find_files('input')
find_files('output')
do_action()
