require 'test_helper'
require 'fileutils'

describe Crossover::Server do

  before do
    if Crossover::Server.in_service?(50000)
      Crossover::Server.close(50000)
    end
  end

  it 'should listen for any connection' do
  end

  it 'should log data by default on ~/crossover.log' do
    # system("rm ~/crossover.log")
    # server = Crossover::Server.new(50000)
    # server.start
    # # server.join
    # # Crossover::Client.post 'Hello, world!', '127.0.0.1', 50000
    # # `crossover client post -d "Hello, world!"`
    # out = `cat ~/crossover.log`
    # out.match(/Hello, world!/)
    # server.stop
  end

  it 'should accept data from a client' do
  end

  describe 'when there is another server at the same address and port' do

    it 'should give en error' do
      #
    end

  end
end

