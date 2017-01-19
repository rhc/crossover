require 'socket'
module Crossover
  module Client
    def self.read_1024_bytes_from_dev_urandom
      File.read("/dev/urandom", 1024)
    end

    # Returns a copy of String
    def self.clean_out_non_UTF8_compliant_chars(str)
      str.encode(Encoding::UTF_8, invalid: :replace, undef: :replace, replace: '')
    end

    def self.replace_all_spaces_with_asterisk(str)
      str.gsub(/\s/, '*')
    end

    def self.clean_data
      str = read_1024_bytes_from_dev_urandom
      clean = clean_out_non_UTF8_compliant_chars(str)
      replace_all_spaces_with_asterisk(clean)
    end

    def self.post(server, port)
      p server
      p port
      socket = TCPSocket.open(server, port)
      while line = socket.gets   # Read lines from the socket
        puts line.chop      # And print with platform line terminator
      end
      socket.close               # Close the socket when done
    end

  end

end
