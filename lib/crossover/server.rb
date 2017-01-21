require 'gserver'

# listen to a given port
# accepts data from client
# send ack to client
# close the connection
#
# Can accept multiple client
# Can listen on multiple ports

module Crossover
  class Server < GServer

    def initialize( port, *args)
      super(port, *args)
      # @socket = TCPServer.new('localhost', port)
      # puts "* Server listening on port #{port} "
      # puts "Use Ctrl-C to stop"
      # puts " "
    end

    def serve(io)
      io.puts(Time.now.to_s)
    end

    # def start
    #   loop do
    #     Thread.start(socket.accept) do |client|
    #       puts "#{client.peeraddr}"
    #       puts "Connection from #{client.peeraddr[2]} at #{client.peeraddr[3]}"
    #       client.puts Time.now
    #       print(client.addr(true), " is gone\n")
    #       client.puts "\nGoodbye"
    #       client.close
    #     end
    #   end
    # end

    # def stop
    # end

  end

end
