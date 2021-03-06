require 'nokogiri'
require 'ffi/libvirt'

module Libvirt
  autoload :Connection, 'libvirt/connection'
  autoload :Domain, 'libvirt/domain'
  autoload :Error, 'libvirt/error'
  autoload :Exception, 'libvirt/exception'
  autoload :Spec, 'libvirt/spec'

  # Initializes the library by calling `virInitialize`. Most methods
  # in libvirt actually call this themselves, so its not strictly
  # necessary. However, it is good practice and is **highly** recommended
  # in a multithreaded environment.
  def self.initialize!
    FFI::Libvirt.virInitialize == 0
  end

  # Returns the version of `libvirt` on the client machine. **This is
  # not the version of the `libvirt` ruby library.** The result is
  # return as an array of `[major, minor, patch]`.
  #
  # @return [Array]
  def self.version
    FFI::Libvirt.version
  end
end

# Disable the stderr output which libvirt defaults to.
Libvirt::Error.on_error
