require "ffi"
require 'ffi/stat/native'
require 'ffi/stat/posix'

module FFI::Stat
  include FFI::Stat::Native if FFI::Stat::Native.active?
  include FFI::Stat::Posix if FFI::Stat::Posix.active?
end

require "ffi/stat/#{FFI::Platform::NAME}/stat"
