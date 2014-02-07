# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'class_config'

Gem::Specification.new do |spec|
  spec.name          = "class_config"
  spec.version       = ClassConfig::VERSION
  spec.authors       = ["Gabriel Naiman"]
  spec.email         = ["gabynaiman@gmail.com"]
  spec.description   = 'Class configuration attributes'
  spec.summary       = 'Class configuration attributes'
  spec.homepage      = 'https://github.com/gabynaiman/class_config'
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest', '~> 4.7'
  spec.add_development_dependency 'turn', '~> 0.9'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'pry'
end
