# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'opalracer'

Gem::Specification.new do |spec|
  spec.name          = 'opalracer'
  spec.version       = OpalRacer::VERSION
  spec.authors       = ['Stephen Crosby']
  spec.email         = ['stevecrozz@gmail.com']
  spec.summary       = %q{Run Ruby within Ruby, but without the other Ruby}
  spec.description   = %q{An isolated Ruby runtime that lets you execute Ruby scripts in isolation from the main Ruby interpreter}
  spec.homepage      = "https://github.com/stevecrozz/opalracer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'therubyracer'
  spec.add_runtime_dependency 'opal'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
