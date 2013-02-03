module FFI
  module Stat
    class Stat < FFI::Struct
      layout :st_dev,       :dev_t,
             :st_ino,       :ino_t,
             :st_mode,      :mode_t,
             :st_nlink,     :nlink_t,
             :st_uid,       :uid_t,
             :st_gid,       :gid_t,
             :st_rdev,      :dev_t,
             :st_atimespec, FFI::Stat::Timespec,
             :st_mtimespec, FFI::Stat::Timespec,
             :st_ctimespec, FFI::Stat::Timespec,
             :st_size,      :off_t,
             :st_blocks,    :quad_t,
             :st_blksize,   :ulong,
             :st_flags,     :ulong,
             :st_gen,       :ulong
    end
  end
end
