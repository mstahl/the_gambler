# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'the_gambler/version'

Gem::Specification.new do |spec|
  spec.name          = "the_gambler"
  spec.version       = TheGambler::VERSION
  spec.authors       = ["max thom stahl"]
  spec.email         = ["max@villainousindustries.com"]
  spec.description   = %q{
    Really common tasks in programs that use playing cards are a pain to
    implement. This is my implementation. Use it. Or don't.
  }
  spec.summary       = %q{Classes and modules for card-playing apps.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
