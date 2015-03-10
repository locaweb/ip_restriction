# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ip_restriction/version'

Gem::Specification.new do |spec|
  spec.name          = 'ip_restriction'
  spec.version       = IpRestriction::VERSION
  spec.authors       = ['Locaweb']
  spec.email         = ['developers@locaweb.com.br']
  spec.summary       = 'Restrict some IPs'
  spec.description   = 'Restrict some IPs to do something'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files = Dir['lib/**/*'].select { |f| File.file?(f) }
  spec.test_files = spec.files.grep(/^spec\//)
  spec.executables = []
  spec.require_paths = %w(lib)

  spec.add_development_dependency 'pry-nav', '~> 0.2.0', '>= 0.2.4'
  spec.add_development_dependency 'rspec', '~> 3.1.0', '>= 3.1.0'
  spec.add_development_dependency 'rubocop', '~> 0.27.0', '>= 0.27.1'
  # for documentation
  spec.add_development_dependency 'yard', '~> 0.8.0', '>= 0.8.7'
  spec.add_development_dependency 'redcarpet', '~> 3.2.0', '>= 3.2.2'
end
