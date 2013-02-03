# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ffi/stat/version'

Gem::Specification.new do |gem|
  gem.name          = "ffi-stat"
  gem.version       = FFI::Stat::VERSION
  gem.authors       = ["Adam Tanner"]
  gem.email         = ["adam@adamtanner.org"]
  gem.description   = %q{FFI bindings for libc stat}
  gem.summary       = %q{FFI bindings for libc stat}
  gem.homepage      = "https://github.com/adamtanner/ffi-stat"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "ffi"

  gem.add_development_dependency "rake"
end
