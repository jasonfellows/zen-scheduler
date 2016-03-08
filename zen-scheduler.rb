require './lib/file_reader'

puts "\nZenScheduler\n------------\n\n"

puts FileReader.new('sample_data.txt').to_string

puts "\n"
