require 'thor'

module Crossover
  class CLI < Thor

    desc 'client', 'Send data to a remote HOST listening on PORT'
    method_option :host, aliases: '-h', default: '127.0.0.1'
    method_option :port, aliases: '-p', default: 50000, type: :numeric
    def client
      begin
        remote_host = options[:host]
        port = options[:port]
        puts Client.post(remote_host, port)

      rescue Errno::ECONNREFUSED
        puts "Sorry! Connection refused by #{remote_host} on  port #{port}"

      rescue Errno::EADDRNOTAVAIL
        puts "Sorry! Can't assign requested address for #{remote_host} on port #{port}"

      rescue Interrupt
        puts "\nExiting ..."
      end
    end

    desc 'server', 'Launch a server listening on PORT'
    method_option :host, aliases: '-h', default: '127.0.0.1', type: :string
    method_option :port, aliases: "-p", default: 50000, type: :numeric
    method_option :logfile, aliases: "-l", default: "~/crossover.log", type: :string
    method_option :max_connections, aliases: '-c', default: 1000, type: :numeric
    def server
      begin
        host = options[:host]
        port = options[:port].to_i
        logfile = options[:logfile]
        max_connections = options[:max_connections]
        @server = Server.new( port, host, max_connections, logfile, true   )
        @server.start
        @server.join

      rescue Errno::EADDRINUSE
        puts "Sorry! The port #{port} is already in use."

      rescue Errno::EACCES => e
        puts "Sorry! Ensure that you have the correct permissions as per message below:\n#{e}  "

      rescue Interrupt
        puts "\nExiting ..."
      end
    end

  end

end
