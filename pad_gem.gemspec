# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pad_gem/version'

Gem::Specification.new do |spec|
  spec.name          = "pad_gem"
  spec.version       = PadGem::VERSION
  spec.required_ruby_version = '>= 2.2'
  spec.authors       = ["Nico Schuele"]
  spec.email         = ["help@padstone.io"]
  spec.summary       = "Gem generator"
  spec.description   = "PadGem is a simple gem generator and part of the Padstone app builder"
  spec.homepage      = "http://padstone.io"
  spec.license       = "Apache-2.0"
  spec.files         = Dir["{lib}/**/*", "LICENSE.txt", "Rakefile", "README.md"]
  spec.executables   << 'padgem'
  spec.require_paths = ["lib"]
  spec.add_dependency 'pad_utils', '>=1.0', '< 2.0'
end
