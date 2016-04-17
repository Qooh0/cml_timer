require "cml_timer/version"
require "cml_timer/config"
require "cml_timer/timer"

=begin
cml_timer is command line timer.

This file is root of cml_timer.
=end

module CmlTimer
  class CmlTimer
    def start(wait_time_second:)
      t = ::CmlTimer::Timer.new(wait_time_second: wait_time_second)
      t.exec
    end
  end
end
