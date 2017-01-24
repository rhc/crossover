$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)


require 'simplecov'
SimpleCov.start
require 'crossover'
require 'minitest/autorun'

require 'open3'


def run_command cli
  stdin, stdout, stderr, thread = Open3.popen3(cli)
  if block_given?
    yield stdout
  end
  stdin.close
  stdout.close
  stderr.close
  thread.kill
end


      #
      # run_command('crossover server') do |console|
      #   run_command('crossover client')
      #
      #   console.must_match(/client:.*\s+connect/)
      #   console.must_match(/client:.*post.*\d+\s+bytes/)
      #   console.must_match(/client:.*\+disconnect/)
      # end
#
