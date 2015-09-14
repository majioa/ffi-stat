require 'rspec'
require "ffi/stat"

RSpec.describe FFI::Stat do
  let(:rb_stat) {
     File.stat(__FILE__)
  }
  subject {
     puts "File  #{__FILE__}"
     p File.exist?(__FILE__)
     s = File.stat(__FILE__)
     puts "rb_stat #{s.inspect}"
      
     v = FFI::Stat.stat(__FILE__)
     p FFI::Platform
     p FFI::Platform::NAME
     puts v.values.inspect
     puts v[:st_mtimespec].values.inspect
     puts v[:st_atimespec].values.inspect
     puts v[:st_ctimespec].values.inspect
     v
  }

  describe ".stat" do
    context "core fields be valid" do
      it { expect(subject[:st_dev]).to be_eql(rb_stat.dev) }
      it { expect(subject[:st_ino]).to be_eql(rb_stat.ino) }
      it { expect(subject[:st_mode]).to be_eql(rb_stat.mode) }
      if FFI::Platform::NAME =~ /linux/
        it { expect(subject[:st_nlink]).to be_eql(rb_stat.nlink) }
      end
      it { expect(subject[:st_uid]).to be_eql(rb_stat.uid) }
      it { expect(subject[:st_gid]).to be_eql(rb_stat.gid) }
      it { expect(subject[:st_rdev]).to be_eql(rb_stat.rdev) }
      it { expect(subject[:st_size]).to be_eql(rb_stat.size) }
      it { expect(subject[:st_blksize]).to be_eql(rb_stat.blksize) }
      it { expect(subject[:st_blocks]).to be_eql(rb_stat.blocks) }
    end

    context "time fields be valid" do
      it do
         expect(subject[:st_mtimespec].to_time.strftime("%N-%c")).to be_eql(
            File.mtime(__FILE__).strftime("%N-%c"))
      end
      it do
         expect(subject[:st_atimespec].to_time.strftime("%N-%c")).to be_eql(
            File.atime(__FILE__).strftime("%N-%c"))
      end
      it do
         expect(subject[:st_ctimespec].to_time.strftime("%N-%c")).to be_eql(
            File.ctime(__FILE__).strftime("%N-%c"))
      end
    end
  end
end
