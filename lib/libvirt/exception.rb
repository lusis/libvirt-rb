module Libvirt
  # Contains all the potential exceptions which the library can
  # throw. This is different from a {Libvirt::Error}, which represents
  # an actual `libvirt` error object.
  module Exception
    # Represents an exceptional event within the Libvirt library.
    # This contains an `error` readable attribute which, if available,
    # is a {Libvirt::Error} object, which contains more details
    # about the error which occurred.
    class LibvirtError < StandardError
      attr_reader :error

      def initialize(error)
        @error = error
        super(error.message)
      end
    end
  end
end
