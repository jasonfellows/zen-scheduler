class Scheduler

  def initialize(rooms, meetings)
    @remaining_meetings = []
    @rooms = rooms
  end

  def to_s
    output = ''

    @rooms.each_with_index do |room, i|
      output << "Room #{i+1}:#{room.to_s}\n\n"
    end

    if @remaining_meetings.any?
      output << "The following meetings were not able to be scheduled:\n"
      @remaining_meetings.each do |meeting|
        output << "#{meeting.to_s}\n"
      end
    end

    output
  end
end
