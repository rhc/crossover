require 'test_helper'

# class CrossoverCLITest < Minitest::Test
#
#   def test_client_can_send_data_to_server
#   end
#
#   def test_client_get_a_nice_error_message_when_the_connection_is_refused
#     out = capture_io{ Crossover::CLI.start %w{client -p 1000} }.join ""
#     assert_equal out , ' '
#   end
#
# end

describe Crossover::CLI do

  describe '#client' do
    it 'should provide error message when connection is refused by the remote server' do
      out = capture_io{ Crossover::CLI.start %w{client -p 1000} }.join ""
      out.must_match( /Sorry! Connection refused/  )
    end

    it 'should provide error message when the requested address/port is not available on the remote server' do
      out = capture_io{ Crossover::CLI.start %w{client -p 0} }.join ""
      out.must_match( /Can't assign requested address/ )
    end

  end

end
