# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "ffi-stat"
  spec.version       = "0.3.0"
  spec.authors       = ["Adam Tanner"]
  spec.email         = ["adam@adamtanner.org"]
  spec.description   = %q{ Ruby FFI bindings for stat }
  spec.summary       = %q{ Ruby FFI bindings for stat }
  spec.homepage      = "https://github.com/adamtanner/ffi-stat"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) {|f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ["lib"]

  spec.add_dependency "ffi"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'minitest', '~> 5.8'
end
