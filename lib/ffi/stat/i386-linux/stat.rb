module FFI::Stat
  module Native
    extend FFI::Library

    ffi_lib FFI::Library::LIBC

    attach_function :__xstat,  [ :int, :string, :pointer ], :int
    attach_function :__lxstat, [ :int, :string, :pointer ], :int
    attach_function :__fxstat, [ :int, :int,    :pointer ], :int
  end

  class Timespec < FFI::Struct
    layout :tv_sec,  :time_t,
           :tv_nsec, :long

    def to_time
      Time.at(self[:tv_sec], self[:tv_nsec].to_r/1000)
    end
  end

  class Stat < FFI::Struct
    layout :st_dev,     :dev_t,
           :__pad0,     :uint32,
           :st_ino,     :ino_t,
           :st_mode,    :mode_t,
           :st_nlink,   :nlink_t,
           :st_uid,     :uid_t,
           :st_gid,     :gid_t,
           :st_rdev,    :dev_t,
           :__pad1,     :uint32,
           :st_size,    :off_t,
           :st_blksize, :ulong,
           :st_blocks,  :ulong,
           :st_atimespec, FFI::Stat::Timespec,
           :st_mtimespec, FFI::Stat::Timespec,
           :st_ctimespec, FFI::Stat::Timespec,
           :add1,       :uint32,
           :add2,       :uint32,
           :add3,       :uint32,
           :add4,       :uint32,
           :add5,       :uint32,
           :add6,       :uint32
  end

  # File types.
  S_IFMT   = 0x170000
  S_IFSOCK = 0x140000
  S_IFLNK  = 0x120000
  S_IFREG  = 0x100000
  S_IFBLK  = 0x060000
  S_IFDIR  = 0x040000
  S_IFCHR  = 0x020000
  S_IFIFO  = 0x010000

  # File modes.
  S_ISUID  = 0x004000
  S_ISGID  = 0x002000
  S_ISVTX  = 0x001000

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

  def self.stat(path)
    stat = FFI::Stat::Stat.new

    FFI::Stat::Native.__xstat(3, path, stat.pointer)

    stat
  end

  def self.lstat(path)
    stat = FFI::Stat::Stat.new

    FFI::Stat::Native.__lxstat(3, path, stat.pointer)

    stat
  end

  def self.fstat(fd)
    stat = FFI::Stat::Stat.new

    FFI::Stat::Native.__fxstat(3, fd, stat.pointer)

    stat
  end
end
