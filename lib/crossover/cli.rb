require 'thor'

module Crossover
  class CLI < Thor

    desc 'client', "Send Data to a remote HOST listening on PORT"
    method_option :host, aliases: "-h", default: "127.0.0.1"
    method_option :port, aliases: "-p", default: "50000"
    method_option :retries, aliases: '-r', default: "0"
    def client
      server = options[:server] || "localhost"
      port = options[:port] || 50000
      # retries = options[:retries] || 0
      puts Client.post(server, port)
    end

    desc 'server', 'Launch a server listening on PORT'
    method_option :port, aliases: "-p", default: "50000"
    def server
      port = options[:port] || 50000
      byebug
      if Server.in_service?(port)
        puts "Cannot create  new server. Already running!"
      else
        @server = Server.new(port)
        @server.audit = true
        @server.start
        @server.join
      end
    end

  end

end
