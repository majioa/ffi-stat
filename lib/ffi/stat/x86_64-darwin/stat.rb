module FFI::Stat
  module Native
    extend FFI::Library

    ffi_lib FFI::Library::LIBC

    attach_function :stat,  [ :string, :pointer ], :int
    attach_function :lstat, [ :string, :pointer ], :int
    attach_function :fstat, [ :int, :pointer    ], :int
  end

  class Timespec < FFI::Struct
    layout :tv_sec,  :time_t,
           :tv_nsec, :long
  end

  class Stat < FFI::Struct
    layout :st_dev,       :dev_t,
           :st_ino,       :uint32,
           :st_mode,      :mode_t,
           :st_nlink,     :nlink_t,
           :st_uid,       :uid_t,
           :st_gid,       :gid_t,
           :st_rdev,      :dev_t,
           :st_atimespec, FFI::Stat::Timespec,
           :st_mtimespec, FFI::Stat::Timespec,
           :st_ctimespec, FFI::Stat::Timespec,
           :st_size,      :off_t,
           :st_blocks,    :blkcnt_t,
           :st_blksize,   :blksize_t,
           :st_flags,     :uint32,
           :st_gen,       :uint32
  end

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
