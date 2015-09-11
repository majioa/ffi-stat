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

end
