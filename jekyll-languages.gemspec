# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll/languages/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-languages"
  spec.version       = Jekyll::Languages::VERSION
  spec.authors       = ["Jan Lindblom "]
  spec.email         = ["jan@janlindblom.se"]
  spec.summary       = %q{Gives you some language filters.}
  spec.description   = %q{Gives you some language filters.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "liquid"
  spec.add_development_dependency "jekyll"
end
