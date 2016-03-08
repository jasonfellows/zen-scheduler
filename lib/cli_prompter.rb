class CliPrompter
  attr_reader :meetings

  def initialize
    @meetings = []
    continue = 'y'

    while ['Y', 'y'].include? continue do
      puts "\nPlease enter a meeting title followed by the duration in minutes."
      print "(example: Team Lunch 30min): "

      begin
        @meetings << Meeting.new($stdin.gets.chomp)
        print "Add another? (y/n): "
        continue = $stdin.gets.chomp
      rescue
        puts "Sorry, I can't recognize that input."
        print "Try again? (y/n): "
        continue = $stdin.gets.chomp
      end
    end

    puts "\n"
  end
end
