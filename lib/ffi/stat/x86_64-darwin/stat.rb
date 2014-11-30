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

  # File types.
  S_IFMT   = 0x170000
  S_IFIFO  = 0x010000
  S_IFCHR  = 0x020000
  S_IFDIR  = 0x040000
  S_IFBLK  = 0x060000
  S_IFREG  = 0x100000
  S_IFLNK  = 0x120000
  S_IFSOCK = 0x140000

  # File modes.

  # Read, write, execute by owner.
  S_IRWXU  = 0x000700
  S_IRUSR  = 0x000400
  S_IWUSR  = 0x000200
  S_IXUSR  = 0x000100

  # Read, write, execute by group.
  S_IRWXG  = 0x000070
  S_IRGRP  = 0x000040
  S_IWGRP  = 0x000020
  S_IXGRP  = 0x000010

  # Read, write, execute by others.
  S_IRWXO  = 0x000007
  S_IROTH  = 0x000004
  S_IWOTH  = 0x000002
  S_IXOTH  = 0x000001

  S_ISUID  = 0x004000
  S_ISGID  = 0x002000
  S_ISVTX  = 0x001000

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
