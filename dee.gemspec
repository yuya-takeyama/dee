# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dee/version'

Gem::Specification.new do |spec|
  spec.name          = "dee"
  spec.version       = Dee::VERSION
  spec.authors       = ["Yuya Takeyama"]
  spec.email         = ["sign.of.the.wolf.pentagram@gmail.com"]
  spec.description   = %q{Simple DI Container/Service Locater for Ruby}
  spec.summary       = %q{Simple DI Container/Service Locater for Ruby}
  spec.homepage      = "https://github.com/yuya-takeyama/dee"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.1.0"
  spec.add_development_dependency "rspec", "~> 2.14.1"
  spec.add_development_dependency "coveralls"
end
