require 'test_helper'
describe Crossover::CLI do
  include RunCommandHelpers


  describe '#client command' do
    it 'by default, sends data to the local server listening on port 50000' do
      system "pkill -f bin/crossover"
      system "crossover server &"
      run_command("crossover client") do |console|
        console.must_match(/Sending \d+ bytes to port 50000 on 127.0.0.1/)
        console.must_match(/Bye!/)
      end
      system "pkill -f bin/crossover"
    end

    it 'sends data to a remote server listening on a given port e.g. 12345' do
      system "crossover server -p 12345 &"
      system "echo"
      run_command("crossover client -p 12345") do |console|
        console.must_match(/Sending \d+ bytes to port 12345 on 127.0.0.1/)
        console.must_match(/Bye!/)
      end
      system "pkill -f bin/crossover"
    end

    it 'displays an error message when the server refused the connection' do
      run_command("crossover client -p 1000") do |console|
        console.must_match( /Sorry! Connection refused/  )
      end
    end

    it 'displays an error message when the requested address/port is not available' do
      run_command("crossover client -p 0") do |console|
        console.must_match( /Can't assign requested address/ )
      end
    end

  end

  describe '#server command' do
    it 'by default listens on port 50000, accepts data and log it to ~/crossover.log file' do
      system "pkill -f bin/crossover"
      file = File.open('command.sh', 'w')
      system "echo 'crossover server &' > command.sh"
      system "echo 'crossover client '  >> command.sh"
      system "echo 'pkill -f bin/crossover'  >> command.sh"
      system "sh command.sh > result.log"
      file.close

      out = File.open('result.log').readlines.join " "

      # console = capture_subprocess_io {`crossover server & ; crossover client`}.join " "
       out.must_match(/client:.*\s+connect/)
       out.must_match(/client:.*post.*\d+\s+bytes/)
       out.must_match(/client:.*\s+disconnect/)
      system "pkill -f bin/crossover"
  end
  end

  describe '#version command' do
    it 'should be able to print the version of the application' do
      [`crossover -v`, `crossover --version`, `crossover version`].each do |out|
        regex = Regexp.new("Crossover version #{Crossover::VERSION}")
        out.must_match( regex )
      end
    end
  end
end
