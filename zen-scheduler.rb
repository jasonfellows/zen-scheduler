require_relative 'lib/file_reader'
require_relative 'lib/meeting'
require_relative 'lib/room'
require_relative 'lib/scheduler'
require 'optparse'

options = {test_data: false}

OptionParser.new do |opts|
  opts.banner = "Usage: zen-scheduler.rb [options] [room count]"
  opts.separator "Schedule any number of meetings into any number of meeting rooms."
  opts.separator "Options:"
  opts.on("-t", "--test-data", "Use test data (default: sample_data.txt)") do |t|
    options[:test_data] = t
  end
end.parse!

puts "\nZenScheduler\n------------\n\n"

if options[:test_data]
  meetings = FileReader.new('sample_data.txt').meetings
end

room_count = ARGV.last.to_i > 0 ? ARGV.last.to_i : 2

rooms = []
room_count.times do
  rooms << Room.new
end

puts Scheduler.new(rooms, meetings).to_s
