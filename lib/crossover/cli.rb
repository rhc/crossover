require 'thor'

module Crossover
  class CLI < Thor
    desc "hello NAME", "This will greet you"
    option :upcase
    def hello( name )
      greeting = "Hello, #{name}"
      greeting.upcase! if options[:upcase]
      puts greeting
    end
  end
end
