require 'bundler'
Bundler.require
require_relative "event"

class EventCreator
  attr_accessor :title, :start_time
  def initialize
    get_name
    get_start
    get_duration
    get_attendees
    Event.new(@start_time, @duration, @title, @attendees)
  end

  private
  def get_name
    puts "Hello, this is an event assistant. It helps you to create an event."
    puts "Give your event a name."
    print "> "
    @title = gets.chomp
    puts " "
  end

  def get_start
    puts "When will your event start ? (format YYYY-MM-DD HH:MM:SS)"
    print "> "
    @start_time = gets.chomp
    puts ""
  end

  def get_duration
    puts "How many MINUTES will your event last ? (Positive integer only)"
    print "> "
    @duration = gets.chomp.to_i
    puts ""
  end

  def get_attendees
    puts "Who do you want to invite ? (separate their emails by ',')"
    print "> "
    guest_list = []
    gets.chomp.split(',').each {|person| guest_list << person }
    puts ""
    @attendees = guest_list
  end
end
