require_relative 'meeting'

class Room
  attr_accessor :meetings

  def initialize
    @meetings = []

    @day_start = Time.new(Time.now.year, Time.now.month, Time.now.day, 9)
    @day_end = Time.new(Time.now.year, Time.now.month, Time.now.day, 17)

    @lunch_start = Time.new(Time.now.year, Time.now.month, Time.now.day, 12)
    @lunch_end = Time.new(Time.now.year, Time.now.month, Time.now.day, 13)
  end

  def meetings_before_lunch
    @meetings.reject{|m| m.start_time >= @lunch_start}
  end

  def meetings_after_lunch
    @meetings.reject{|m| m.start_time < @lunch_end}
  end

  def push(meeting)
    if meeting.is_a?(Meeting)
      schedule(meeting)
    else
      raise "Error: only meetings can be added to room schedules"
    end
  end

  def largest_remaining_block
    [
      ((@lunch_start) - (@day_start + used_before_lunch*60)) / 60,
      ((@day_end) - (@lunch_end + used_after_lunch*60)) / 60
    ].max
  end

  def schedule(meeting)
    if time_before_lunch? meeting.duration
      meeting.start_time = @day_start + used_before_lunch*60
      @meetings << meeting
      true
    elsif time_after_lunch? meeting.duration
      meeting.start_time = @lunch_end + used_after_lunch*60
      @meetings << meeting
      true
    else
      false
    end
  end

  def time_before_lunch?(duration)
    @day_start + used_before_lunch*60 + duration*60 <= @lunch_start
  end

  def time_after_lunch?(duration)
    @lunch_end + used_after_lunch*60 + duration*60 <= @day_end
  end

  def to_s
    meetings_before_lunch.map(&:to_s).join("\n") +
    "\n#{@lunch_start.strftime('%I:%M%p')} Lunch\n" +
    meetings_after_lunch.map(&:to_s).join("\n")
  end

  def used_before_lunch
    meetings_before_lunch.any? ? meetings_before_lunch.map(&:duration).inject(:+) : 0
  end

  def used_after_lunch
    meetings_after_lunch.any? ? meetings_after_lunch.map(&:duration).inject(:+) : 0
  end
end
