require "ffi"
require 'ffi/stat/native'
require 'ffi/stat/posix'

module FFI::Stat
  include FFI::Stat::Native
  include FFI::Stat::Posix
end

require "ffi/stat/#{FFI::Platform::NAME}/stat"
