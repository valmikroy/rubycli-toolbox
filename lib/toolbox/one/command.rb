require 'toolbox/one/helper'


module Toolbox
  module One 
    class Command

      include Toolbox::One::Helper

      attr_reader :options
      def initialize(options = {})
        @options = options
      end  


      def call
        log_info("Running command one")
      end  

    end  
  end  
end

