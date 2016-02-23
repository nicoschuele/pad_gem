# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'PADGEM_GEM_RUBY_NAME/version'

Gem::Specification.new do |spec|
  spec.name          = "PADGEM_GEM_RUBY_NAME"
  spec.version       = PADGEM_GEM_NAME::VERSION
  spec.required_ruby_version = '>= PADGEM_MIN_RUBY_VERSION'
  spec.authors       = ["PADGEM_AUTHOR"]
  spec.email         = ["PADGEM_EMAIL"]
  spec.summary       = "Gem summary"
  spec.description   = "Gem description"
  spec.homepage      = "PADGEM_HOMEPAGE"
  spec.license       = "Apache-2.0"
  spec.files         = Dir["{lib}/**/*", "LICENSE.txt", "Rakefile", "README.md"]
  spec.executables   << 'PADGEM_EXECUTABLE'
  spec.require_paths = ["lib"]
end
