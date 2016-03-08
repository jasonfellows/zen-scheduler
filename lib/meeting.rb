class Meeting
  attr_accessor :duration, :title

  def initialize(input_string)
    split_string = input_string.split(' ')
    raise "Error: unable to read meeting input string: '#{input_string}'" if split_string.length < 2
    @duration = split_string.pop
    raise "Error: invalid duration: '#{@duration}'" if !valid_duration?
    @title = split_string.join(' ')
  end

  def valid_duration?
    true
  end

  def to_string
    "#{@title} #{duration}"
  end
end
