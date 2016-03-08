require './lib/file_reader'
require './lib/meeting'
require './lib/room'

puts "\nZenScheduler\n------------\n\n"

meetings = FileReader.new('sample_data.txt').meetings

room1 = Room.new

meetings.each do |meeting|
  room1.push(meeting)
end

puts room1.to_string

puts "\n"
