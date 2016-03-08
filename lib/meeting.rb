class Meeting
  attr_accessor :start_time
  attr_reader :duration, :title

  def initialize(input_string, start_time=nil)
    @start_time = start_time
    split_string = input_string.split(' ')
    raise "Error: unable to read meeting input string: '#{input_string}'" if split_string.length < 2
    duration_string = split_string.pop
    raise "Error: invalid duration: '#{duration_string}'" if !valid_duration?(duration_string)
    @duration = duration_string.chop.chop.chop.to_i
    @title = split_string.join(' ')
  end

  def start_time_string
    start_time.nil? ? '???????' : @start_time.strftime('%I:%M%p')
  end

  def to_s
    "#{start_time_string} #{@title} #{duration}min"
  end

  def valid_duration?(duration_string)
    /\A\d+min\z/.match(duration_string).to_s == duration_string
  end
end
