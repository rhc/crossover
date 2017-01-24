require 'gserver'
require 'logger'

# listen to a given port
# accepts data from client
# send ack to client
# close the connection
#
# Can accept multiple client
# Can listen on multiple ports

module Crossover
  class Server < GServer

    def initialize(port, host='127.0.0.1', max_connections = 10, stdlog = $stdout, audit = true, debug = false  )
      if stdlog != $stdout
        @logger = Logger.new(File.expand_path(stdlog) )
      end
      super(port, host, max_connections, $stdout, audit, debug )
    end

    def serve(io)
      data = io.read(1024)
      log "client:#{io.peeraddr[1]} #{io.peeraddr[2]}<#{io.peeraddr[3]}> post #{data.bytesize} bytes\n#{data}"
      puts ""
      io.puts('Bye!')
    end

    def stopping
      log("#{self.class.to_s} #{@host}:#{@port} stop")
      @logger.close
    end

    def log message
      if @stdlog
        @stdlog.puts("[#{Time.new.ctime}] %s" % message)
        @stdlog.flush
      end

      if @logger
        @logger.info message
      end
    end

  end
end
