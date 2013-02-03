module FFI
  module Stat
    class Timespec < FFI::Struct
      layout :tv_sec,  :long,
             :tv_nsec, :long
    end
  end
end
