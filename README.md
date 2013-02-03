# FFI::Stat

FFI bindings for libc stat. The primary use of this library is by other FFI libraries that require a stat struct.

## Installation

Add this line to your application's Gemfile:

    gem 'ffi-stat'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ffi-stat

## Usage

```ruby
require "ffi/stat"

file = "test.txt"
fd   = $stdin.fileno

FFI::Stat.stat(file)  #=> FFI::Stat::Stat
FFI::Stat.lstat(file) #=> FFI::Stat::Stat
FFI::Stat.fstat(fd)   #=> FFI::Stat::Stat
```

## Platforms

Currently FFI::Stat has only been tested and known to work on Mac OS X Mountain Lion. Support for other OS platforms are on the roadmap.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
