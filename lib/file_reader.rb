# require 'meeting'

class FileReader
  attr_accessor :meetings

  def initialize(path)
    @meetings = []

    File.open(path, "r").each_line do |line|
      puts line
    end
  end

  def to_string
    @meetings.join('\n')
  end
end
