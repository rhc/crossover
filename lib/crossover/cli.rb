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
      @server = Server.new(port)
      @server.audit = true
      @server.debug = true
      @server.start
      trap("SIGINT") {@server.stop}
      @server.join
    end

  end

end
