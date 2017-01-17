# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'habittracker/version'

Gem::Specification.new do |spec|
  spec.name          = "habittracker"
  spec.version       = Habittracker::VERSION
  spec.authors       = ["Ignazio Calò"]
  spec.email         = ["ignazioc@gmail.com"]

  spec.summary       = "This is a monthly tracker for geeks."
  spec.description   = "This is a monthly tracker for geeks."
  spec.homepage      = "https://github.com/ignazioc/HabitTracker"
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
  spec.required_ruby_version = '~> 2.3'

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"

  spec.add_dependency 'commander'
  spec.add_dependency 'terminal-table'
end
