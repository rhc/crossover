require 'test_helper'

describe Crossover::CLI do

  describe '#client command' do

    it 'by default, sends data to the local server listening on port 50000' do
      run_command("crossover client") do |console|
        console.must_match(/Sending \d+ bytes to port 50000 on 127.0.0.1/)
        console.must_match(/Bye!/)
      end
    end

    it 'send data to a remote server listening on a given port e.g. 12345' do
      run_command("crossover client -p 12345") do |console|
        console.must_match(/Sending \d+ bytes to port 12345 on 127.0.0.1/)
        console.must_match(/Bye!/)
      end
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
      run_command('crossover server') do |console|
        run_command('crossover client')

        console.must_match(/client:.*\s+connect/)
        console.must_match(/client:.*post.*\d+\s+bytes/)
        console.must_match(/client:.*\+disconnect/)
      end
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
