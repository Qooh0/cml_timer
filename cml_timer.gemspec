# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cml_timer/version'

Gem::Specification.new do |spec|
  spec.name          = "cml_timer"
  spec.version       = CmlTimer::VERSION
  spec.authors       = ["Kaieda Kensuke"]
  spec.email         = ["qooh0.info@gmail.com"]

  spec.summary       = %q{cml_timer is command line timer}
  spec.description   = %q{cml_timer is poor command line timer}
  spec.homepage      = "http://rubygems.org/gems/cml_timer"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.license       = "MIT"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", '~> 0'
end
