module CmlTimer
  class Confing
    attr_accessor :pid_file_directory, :system_voice, :notification_word

    def initialize
      # pid file directory
      @pid_file_directory = '/tmp'

      @system_voice = 'Vicki'
      @notification_word = 'Good work!! Time up!'
    end

    def say_command
      %x(say -v #{@system_voice} #{@notification_word})
    end

    def error_text(exception)
      "[ERROR]\t#{exception}"
    end

    def error_processing
      STDERR.puts error_text
    end

    def pid_file_prefix
      'cml_timer'
    end
  end
end
