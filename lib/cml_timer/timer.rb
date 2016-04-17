module CmlTimer
  class Timer
    attr_accessor :wait_time

    def initialize(wait_time_second: )
      @pid = Process.pid
      @config = ::CmlTimer::Confing.new

      @wait_time = wait_time_second
      @pid_file_name = "#{@config.pid_file_prefix}_#{@wait_time}_#{@pid}.pid"
      @pid_file = File.join(@config.pid_file_directory, @pid_file_name)
    end

    def exec
      begin
        verify
        daemonize
        execute
        post_processing
      rescue => e
        @config.error_processing(e)
      end
    end

    private

    def verify
      @wait_time.to_i
    end

    def daemonize
      begin
        Process.daemon(true, false)
        open(@pid_file, 'w') { |f| f << @pid  } if @pid_file
      rescue => e
        @config.error_processing(e)
      end
    end

    def execute
      sleep @wait_time.to_i * 60
    end

    def post_processing
      delete_pid_file
      notice_by_voice
    end

    def notice_by_voice
      @config.say_command
    end

    def delete_pid_file
      begin
        File.delete @pid_file
      rescue => e
        @config.error_processing(e)
      end
    end
  end
end
