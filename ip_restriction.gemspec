# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ip_restriction/version'

Gem::Specification.new do |spec|
  spec.name          = "ip_restriction"
  spec.version       = IpRestriction::VERSION
  spec.authors       = ["Locaweb"]
  spec.email         = ["developers@locaweb.com.br"]
  spec.description   = %q{IP restricion for IPs to use in rails routes in :constraints, for example to restrict access to URL /redis}
  spec.summary       = %q{IP restricion for IPs to use in rails routes in :constraints, for example to restrict access to URL /redis}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "geminabox"
end
