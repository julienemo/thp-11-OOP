require 'pry'
require 'time'

class Event

  # PUBLIC SECTION
  attr_accessor :start_time, :duration, :title, :attendees
  attr_reader:status, :end_time
  @@event_count = 0

  # here is how to start a new event
  def initialize(start_time, duration_min, title, attendees)
    # data validation
    # for the moment I can only validate duration with is positive integer
    if (duration_min.to_i == duration_min) && (duration_min > 0)

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
      self.to_s
    else
      puts "Duration needs to be positive integer."
      puts "Event not created, please start again"
    end
  end

  def end_time
    # Time.parse converst time to string and string to time
    # I make sure I don't convert somthing that is already time
    unless @start_time.class == Time
      @start_time = Time.parse(@start_time)
    end
    @end_time = @start_time+ @duration * 60
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

  # this is copy-paste from day 12 course
  def age_analysis
      age_array = []
      average = 0

      @attendees.each do |attendee| #On parcourt tous les participants (objets de type User)
        age_array << attendee.age #leur âge est stocké dans l'array des âges
        average = average + attendee.age #leur âge est additionné pour préparer le calcul de la moyenne
      end

      average = average / attendees.length #on divise la somme des âges pour avoir la moyenne

      puts "Voici les âges des participants :"
      puts age_array.join(", ")
      puts "La moyenne d'âge est de #{average} ans"
    end

  private
  def show
    return self
  end

end
