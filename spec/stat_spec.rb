require "minitest/spec"
require "minitest/autorun"
require "ffi/stat"

describe FFI::Stat do
  it "can stat a file" do
    skip unless FFI::Stat.respond_to?(:stat)

    ffi_stat = FFI::Stat.stat(__FILE__)
    rb_stat = File.stat(__FILE__)

    ffi_stat[:st_dev].must_equal(rb_stat.dev)
    ffi_stat[:st_ino].must_equal(rb_stat.ino)
    ffi_stat[:st_mode].must_equal(rb_stat.mode)
    ffi_stat[:st_nlink].must_equal(rb_stat.nlink)
    ffi_stat[:st_uid].must_equal(rb_stat.uid)
    ffi_stat[:st_gid].must_equal(rb_stat.gid)
    ffi_stat[:st_rdev].must_equal(rb_stat.rdev)

    ffi_stat[:st_size].must_equal(rb_stat.size)
    ffi_stat[:st_blksize].must_equal(rb_stat.blksize)
    ffi_stat[:st_blocks].must_equal(rb_stat.blocks)
  end

  it "can matches file times" do
    skip unless FFI::Stat.respond_to?(:stat)

    ffi_stat = FFI::Stat.stat(__FILE__)

    ffi_stat[:st_mtimespec].to_time.inspect.must_equal(File.mtime(__FILE__).inspect)
    ffi_stat[:st_atimespec].to_time.inspect.must_equal(File.atime(__FILE__).inspect)
    ffi_stat[:st_ctimespec].to_time.inspect.must_equal(File.ctime(__FILE__).inspect)
  end
end
