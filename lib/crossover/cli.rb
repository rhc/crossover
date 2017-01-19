require 'thor'

module Crossover
  class CLI < Thor

    desc 'client', "Send Data to a SERVER listening on PORT"
    method_option :server, aliases: "-s", default: "127.0.0.1"
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
      puts Server.new(port).start
    end

  end

end
