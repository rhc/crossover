$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)


require 'simplecov'
SimpleCov.start
require 'crossover'
require 'minitest/autorun'
require 'support/run_command_helpers'





      #
      # run_command('crossover server') do |console|
      #   run_command('crossover client')
      #
      #   console.must_match(/client:.*\s+connect/)
      #   console.must_match(/client:.*post.*\d+\s+bytes/)
      #   console.must_match(/client:.*\+disconnect/)
      # end
#
