require './lib/room'

class Scheduler

  def initialize(rooms, meetings)
    @rooms = rooms
  end

  def to_s
    output = ''
    @rooms.each_with_index do |room, i|
      output << "Room #{i}:#{room.to_s}\n\n"
    end
    output
  end

end
