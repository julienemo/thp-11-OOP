require 'pry'
require 'time'

class Event

  # PUBLIC SECTION
  attr_accessor :start_time, :duration, :title, :attendees
  attr_reader:status, :end_time
  @@event_count = 0

  # here is how to start a new event
  def initialize(start_time, duration_min, title, attendees)
    # My event is created, I increment the class var
    @@event_count += 1

    # these are the instance vars that I pass directly
    @title = title
    @attendees = attendees
    @duration = duration_min

    # this var, I need to retreat
    # I don't put end_time here coz it is in initialize
    # then if someone modifies the start_time, the end_time won't recalculate
    @start_time = Time.parse(start_time)

    # this is only to confirm the user that all is well
    puts "Event N.#{@@event_count}--'#{@title}' created."
  end

  def end_time
    # Time.parse converst time to string and string to time
    # I make sure I don't convert somthing that is already time
    unless @start_time.class == Time
      @start_time = Time.parse(@start_time)
    end
    @end_time =@start_time+ @duration * 60
  end

  def postpone_24h
    @start_time = @start_time + 24*60*60
  end

  def status
    unless @start_time.class == Time
      @start_time = Time.parse(@start_time)
    end

    if Time.now + 30*60 < @start_time
      @status = "futur"
    elsif (Time.now + 30*60 >= @start_time) && (Time.now < @start_time)
      @status = "soon"
    elsif (Time.now >= @start_time) && (Time.now < end_time)
      @status = "going"
    else
      @status = "past"
    end
    return @status
  end

  def to_s
    puts "Title: #{@title}"
    puts "Status: #{status}"
    puts "Start time: #{@start_time}"
    puts "End time: #{end_time}"
    puts "Duration: #{@duration} minutes"
    puts "Participants: #{@attendees.join(",")}"
  end



  private
  def show
    return self
  end

end

binding.pry
puts "Program ends here."

=begin
def self.count
end


def self.all?
  return @@all_users
end
=end
