# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'potion/version'

Gem::Specification.new do |spec|
  spec.name          = "potion"
  spec.version       = Potion::VERSION
  spec.authors       = ["Michael C. Beck"]
  spec.email         = ["michael.beck@qualeapps.com"]
  spec.description   = %q{Potion - dependency management for your Objective-C Projects.}
  spec.summary       = %q{Potion is a dependency management tool for your Objective-C Projects, but can be used to manage almost any project, as it is not specific to any language.}
  spec.homepage      = "http://quale.de/potion"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
