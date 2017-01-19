require 'socket'
module Crossover
  class Server
    attr_reader :socket

    def initialize port
      @socket = TCPServer.new('localhost', port)
      puts "Server Started on port #{port} "
    end

    def start
      loop do
        Thread.start(socket.accept) do |client|
          puts "#{client.peeraddr}"
          puts "Connection from #{client.peeraddr[2]} at #{client.peeraddr[3]}"
          client.puts Time.now
          print(client.addr(true), " is gone\n")
          client.puts "\nGoodbye"
          client.close
        end
      end
    end

    def stop

    end

  end

end
