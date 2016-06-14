# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bmtc/version'

Gem::Specification.new do |spec|
  spec.name          = 'bmtc'
  spec.version       = Bmtc::VERSION
  spec.authors       = ['Aboobacker MK']
  spec.email         = ['aboobackervyd@gmail.com']

  spec.summary       = 'BMTC api '
  spec.description   = 'BMTC api'
  spec.homepage      = 'http://github.com/tachyons/bmtc'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_dependency 'httparty'
  spec.add_dependency 'json'
end
