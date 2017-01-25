# Crossover


This gem allows the following apps to work together:

1. A client app
.- Reads 1024 bytes from /dev/urandom
.- Cleans out all non UTF-8 compliant chars
.- Replaces all spaces with asterix
.- Sends this data to a server via TCPSocket
2. A server app
.- Listens for any connections
.- Accepts the data from the client app
.- Prints it into a log file

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'crossover'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install crossover

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.
To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/crossover.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

Create a text file with the following information

Instructions to install and configure prerequisites or dependencies, if any

Instructions to create and initialize any data (if required)

Assumptions you have made - it is good to explain your thought process and the assumptions you have made

Requirements that you have not covered in your submission, if any

Instructions to configure and prepare the source code to build and run properly

Issues you have faced while completing the assignment, if any

Constructive feedback for improving the assignment

