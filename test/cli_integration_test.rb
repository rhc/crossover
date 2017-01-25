require 'test_helper'
describe Crossover::CLI do
  include RunCommandHelpers

  describe 'Client command' do
    it 'by default, sends data to the local server listening on port 50000' do
       stop_all_crossover_servers
      system 'crossover server &'
      run_command('crossover client') do |console|
        console.must_match(/Sending \d+ bytes to port 50000 on 127.0.0.1|Sorry/)
        console.must_match(/Bye!/)
      end
       stop_all_crossover_servers
    end

    it 'sends data to a remote server listening on a given port e.g. 12345' do
      system 'crossover server -p 12345 &'
      system 'echo'
      run_command('crossover client -p 12345') do |console|
        console.must_match(/Sending \d+ bytes to port 12345 on 127.0.0.1|Sorry!/)
      end
       stop_all_crossover_servers
    end

    it 'displays an error message when the server refuses the connection' do
      run_command('crossover client -p 1000') do |console|
        console.must_match(/Sorry! Connection refused/)
      end
    end

    it 'displays an error message when the requested address/port is not available' do
      run_command('crossover client -p 0') do |console|
        console.must_match(/Sorry! Can't assign requested address/)
      end
    end
  end

  describe 'Server command' do
    it 'by default listens on port 50000, accepts data and log it to ~/crossover.log file' do
      stop_all_crossover_servers
      file = File.open('command.sh', 'w')
      system "echo 'crossover server &' > command.sh"
      system "echo 'crossover client '  >> command.sh"
      stop_all_crossover_servers
      system 'sh command.sh > result.log'
      file.close

      out = File.open('result.log').readlines.join ' '

      # console = capture_subprocess_io {`crossover server & ; crossover client`}.join " "
      out.must_match(/client:.*\s+connect/)
      out.must_match(/client:.*post.*\d+\s+bytes/)
      out.must_match(/client:.*\s+disconnect/)
      stop_all_crossover_servers
    end
  end

  describe '#version command' do
    it 'should be able to print the version of the application' do
      [`crossover -v`, `crossover --version`, `crossover version`].each do |out|
        regex = Regexp.new("Crossover version #{Crossover::VERSION}")
        out.must_match(regex)
      end
    end
  end
end
