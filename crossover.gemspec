# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'crossover/version'

Gem::Specification.new do |spec|
  spec.name          = "crossover"
  spec.version       = Crossover::VERSION
  spec.authors       = ["Christian Kyony"]
  spec.email         = ["ckyony@changamuka.com"]

  spec.summary       = %q{Sample Client-Server App using TCP Socket.}
  spec.description   = <<-DESC
  - A client app
      * Reads 1024 bytes from /dev/urandom
      * Cleans out all non UTF-8 compliant chars
      * Replaces all spaces with asterix (*)
      * Sends this data to a server via TCPSocket

  - A server app
      * Listens for any connections
      * Accepts the data from the client app
      * Prints it into a log file
  DESC
  spec.homepage      = "https://github.com/rhc/crossover"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  # spec.executables   = "crossover"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "guard", "~> 2.14"
  spec.add_development_dependency "guard-minitest", "~> 2.4.6"
  spec.add_development_dependency "byebug", "~> 9.0"
  spec.add_development_dependency "simplecov", "~> 0.12"

  spec.add_dependency "thor", "~> 0"
  spec.add_dependency "gserver", "~> 0"
end
