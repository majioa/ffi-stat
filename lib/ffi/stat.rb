require "ffi"

module FFI::Stat
  def self.stat(path)
    stat = FFI::Stat::Stat.new

    FFI::Stat::Native.stat(path, stat.pointer)

    stat
  end

  def self.lstat(path)
    stat = FFI::Stat::Stat.new

    FFI::Stat::Native.lstat(path, stat.pointer)

    stat
  end

  def self.fstat(fd)
    stat = FFI::Stat::Stat.new

    FFI::Stat::Native.fstat(fd, stat.pointer)

    stat
  end
end

require "ffi/stat/native"
require "ffi/stat/#{FFI::Platform::NAME}/stat"
