require_relative 'meeting'

class FileReader
  attr_accessor :meetings

  def initialize(path)
    @meetings = []

    File.open(path, "r").each_line do |line|
      @meetings << Meeting.new(line)
    end
  end

  def to_s
    @meetings.map(&:to_s).join("\n")
  end
end
