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
  spec.description   = %q{Sample Client-Server App using TCP Socket.}
  spec.homepage      = ""
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
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-minitest"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "simplecov"

  spec.add_dependency "thor", "~> 0"
  spec.add_dependency "gserver"
end
