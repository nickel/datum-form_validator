# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "datum/form_validator/version"

Gem::Specification.new do |spec|
  spec.name          = "datum-form_validator"
  spec.version       = Datum::FormValidator::VERSION
  spec.authors       = ["Juan Gallego IV"]
  spec.email         = ["juan.gallego.iv@gmail.com"]

  spec.summary       = "Just another form validator"
  spec.description   = "Validate values for each attributes of given schema"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
