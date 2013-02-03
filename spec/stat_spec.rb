require "minitest/spec"
require "minitest/autorun"
require "ffi/stat"

describe FFI::Stat do
  it "can stat a file" do
    file = File.expand_path __FILE__

    stat_struct = FFI::Stat.stat file

    stat_struct[:st_dev       ].wont_be_nil
    stat_struct[:st_ino       ].wont_be_nil
    stat_struct[:st_mode      ].wont_be_nil
    stat_struct[:st_nlink     ].wont_be_nil
    stat_struct[:st_uid       ].wont_be_nil
    stat_struct[:st_gid       ].wont_be_nil
    stat_struct[:st_rdev      ].wont_be_nil
    stat_struct[:st_size      ].wont_be_nil

    stat_struct[:st_atimespec][:tv_sec ].wont_be_nil
    stat_struct[:st_atimespec][:tv_nsec].wont_be_nil
    stat_struct[:st_mtimespec][:tv_sec ].wont_be_nil
    stat_struct[:st_mtimespec][:tv_nsec].wont_be_nil
    stat_struct[:st_ctimespec][:tv_sec ].wont_be_nil
    stat_struct[:st_ctimespec][:tv_nsec].wont_be_nil

    stat_struct[:st_blksize   ].wont_be_nil
    stat_struct[:st_blocks    ].wont_be_nil
  end

  it "can lstat a file" do
    file = File.expand_path __FILE__

    stat_struct = FFI::Stat.lstat file

    stat_struct[:st_dev       ].wont_be_nil
    stat_struct[:st_ino       ].wont_be_nil
    stat_struct[:st_mode      ].wont_be_nil
    stat_struct[:st_nlink     ].wont_be_nil
    stat_struct[:st_uid       ].wont_be_nil
    stat_struct[:st_gid       ].wont_be_nil
    stat_struct[:st_rdev      ].wont_be_nil
    stat_struct[:st_size      ].wont_be_nil

    stat_struct[:st_atimespec][:tv_sec ].wont_be_nil
    stat_struct[:st_atimespec][:tv_nsec].wont_be_nil
    stat_struct[:st_mtimespec][:tv_sec ].wont_be_nil
    stat_struct[:st_mtimespec][:tv_nsec].wont_be_nil
    stat_struct[:st_ctimespec][:tv_sec ].wont_be_nil
    stat_struct[:st_ctimespec][:tv_nsec].wont_be_nil

    stat_struct[:st_blksize  ].wont_be_nil
    stat_struct[:st_blocks   ].wont_be_nil
  end

  it "can fstat a file descriptor" do
    file = File.open(__FILE__)

    stat_struct = FFI::Stat.fstat file.fileno

    stat_struct[:st_dev       ].wont_be_nil
    stat_struct[:st_ino       ].wont_be_nil
    stat_struct[:st_mode      ].wont_be_nil
    stat_struct[:st_nlink     ].wont_be_nil
    stat_struct[:st_uid       ].wont_be_nil
    stat_struct[:st_gid       ].wont_be_nil
    stat_struct[:st_rdev      ].wont_be_nil
    stat_struct[:st_size      ].wont_be_nil

    stat_struct[:st_atimespec][:tv_sec ].wont_be_nil
    stat_struct[:st_atimespec][:tv_nsec].wont_be_nil
    stat_struct[:st_mtimespec][:tv_sec ].wont_be_nil
    stat_struct[:st_mtimespec][:tv_nsec].wont_be_nil
    stat_struct[:st_ctimespec][:tv_sec ].wont_be_nil
    stat_struct[:st_ctimespec][:tv_nsec].wont_be_nil

    stat_struct[:st_blksize   ].wont_be_nil
    stat_struct[:st_blocks    ].wont_be_nil

    file.close
  end
end
