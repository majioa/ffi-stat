# FFI::Stat

FFI platform-specific bindings for the stat struct and related functions. The
primary use case of this library is assist other FFI libraries that require a
stat struct.

## Installation

Add this line to your application's Gemfile:

    gem "ffi-stat"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ffi-stat

## Usage

```ruby
require "ffi/stat"

file = "test.txt"
fd   = $stdin.fileno

stat = FFI::Stat.lstat(file) #=> FFI::Stat::Stat
stat = FFI::Stat.fstat(fd)   #=> FFI::Stat::Stat
stat = FFI::Stat.stat(file)  #=> FFI::Stat::Stat

# then

stat[:st_size] #=> ~~ size of the file
stat[:st_mtimespec].to_time #=> file modification time
```

## Platforms

FFI::Stat has support for the stat struct on the following platforms:

* x86_64-darwin
* x86_64-linux
* i386-linux

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Ensure all tests pass (`rake test`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
