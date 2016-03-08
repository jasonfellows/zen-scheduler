require './lib/meeting'

class FileReader
  attr_accessor :meetings

  def initialize(path)
    @meetings = []

    File.open(path, "r").each_line do |line|
      @meetings << Meeting.new(line)
    end
  end

  def to_string
    @meetings.map(&:to_string).join("\n")
  end
end
