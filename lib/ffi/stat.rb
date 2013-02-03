require "ffi"

require "ffi/stat/timespec"
require "ffi/stat/stat"
require "ffi/stat/library"

module FFI
  module Stat
    def self.stat(path)
      stat_struct = FFI::Stat::Stat.new

      FFI::Stat::Library.stat(path, stat_struct.pointer)

      stat_struct
    end

    def self.lstat(path)
      stat_struct = FFI::Stat::Stat.new

      FFI::Stat::Library.lstat(path, stat_struct.pointer)

      stat_struct
    end

    def self.fstat(fd)
      stat_struct = FFI::Stat::Stat.new

      FFI::Stat::Library.fstat(fd, stat_struct.pointer)

      stat_struct
    end
  end
end
