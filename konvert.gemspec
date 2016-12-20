# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'konvert/version'

Gem::Specification.new do |spec|
  spec.name          = "konvert"
  spec.version       = Konvert::VERSION
  spec.authors       = ["Nauman Tahir"]
  spec.email         = ["nomibzu@gmail.com"]

  spec.summary       = %q{Currency converter gem}
  spec.description   = %q{Konvert is a Ruby command line gem that lets you convert between different currencies and perform arithmetic operations on them from the command line. Just set the currency rates and have fun..}
  spec.homepage      = "https://github.com/Nauman-nxvt/konvert"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
end
