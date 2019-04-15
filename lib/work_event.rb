require 'bundler'
Bundler.require
require_relative "event"


class WorkEvent < Event
  def is_acceptable?
    if (@attendees.length > 3) || (@duration > 60)
      false
    else
      true
    end
  end
end
