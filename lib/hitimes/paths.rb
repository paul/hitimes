#--
# Copyright (c) 2008 Jeremy Hinegardner
# All rights reserved.  See LICENSE and/or COPYING for details.
#++
#
module Hitimes
  module Paths
    #   
    # :call-seq:
    #    Hitimes.root_dir -> String
    #
    # Returns The full expanded path of the parent directory of +lib+
    # going up the path from the current file.  A trailing File::SEPARATOR 
    # is guaranteed.
    #   
    def self.root_dir
      unless @root_dir
        path_parts = ::File.expand_path(__FILE__).split(::File::SEPARATOR)
        lib_index  = path_parts.rindex("lib")
        @root_dir = path_parts[0...lib_index].join(::File::SEPARATOR) + ::File::SEPARATOR
      end 
      return @root_dir
    end 

    # 
    # :call-seq:
    #   Hitimes.lib_path( *args ) -> String
    #
    # Returns The full expanded path of the +lib+ directory below
    # _root_dir_.  All parameters passed in are joined onto the 
    # result. A trailing File::SEPARATOR is guaranteed if 
    # _args_ are *not* present.
    #   
    def self.lib_path(*args)
      self.sub_path("lib", *args)
    end 

    #
    # :call-seq:
    #   Hitimes.sub_path( sub, *args ) -> String
    #
    # Returns the full expanded path of the +sub+ directory below _root_dir.  All
    # _arg_ parameters passed in are joined onto the result.  A trailing
    # File::SEPARATOR is guaranteed if _args_ are *not* present.
    #
    def self.sub_path(sub,*args)
      sp = ::File.join(root_dir, sub) + File::SEPARATOR
      sp = ::File.join(sp, *args) if args
    end
  end
end