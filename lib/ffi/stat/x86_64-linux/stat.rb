module FFI::Stat
  class Timespec < FFI::Struct
    layout :tv_sec,  :time_t,
           :tv_nsec, :long

    def to_time
      Time.at(self[:tv_sec], self[:tv_nsec].to_r/1000)
    end
  end

  class Stat < FFI::Struct
    layout :st_dev,     :dev_t,
           :st_ino,     :ino_t,
           :st_nlink,   :nlink_t,
           :st_mode,    :mode_t,
           :st_uid,     :uid_t,
           :st_gid,     :gid_t,
           :st_rdev,    :dev_t,
           :st_size,    :off_t,
           :st_blksize, :blksize_t,
           :st_blocks,  :blkcnt_t,
           :st_atimespec, FFI::Stat::Timespec,
           :st_mtimespec, FFI::Stat::Timespec,
           :st_ctimespec, FFI::Stat::Timespec,
           :st_attr,    :mode_t,
           :__pad0,     :uint64,
           :__pad1,     :uint64
  end
end
