class Scheduler

  def initialize(rooms, meetings)
    @meetings = meetings.sort{|a,b| a.duration <=> b.duration}
    @remaining_meetings = []
    @rooms = rooms
    schedule
  end

  def schedule
    shortest_duration = @meetings.last.duration

    while @meetings.any? && @rooms.reject{|r| r.largest_remaining_block > shortest_duration}.any?
      @rooms.each do |room|
        @meetings.pop if @meetings.last && room.push(@meetings.last)
      end
    end

    @remaining_meetings = @meetings
  end

  def to_s
    output = ''

    @rooms.each_with_index do |room, i|
      output << "Room #{i+1}:\n#{room.to_s}\n\n\n"
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
