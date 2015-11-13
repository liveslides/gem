# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'liveslides/version'

Gem::Specification.new do |spec|
  spec.name          = "liveslides"
  spec.version       = LiveSlides::VERSION
  spec.authors       = ["Brad Gessler"]
  spec.email         = ["brad@liveslides.com"]

  spec.summary       = %q{LiveSlides.com API wrapper.}
  spec.description   = %q{Embed your websites live web content in presentations.}
  spec.homepage      = "https://github.com/liveslides/gem"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
