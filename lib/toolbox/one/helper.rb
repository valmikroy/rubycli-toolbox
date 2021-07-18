# frozen_string_literal: true

require 'toolbox/helper'

module Toolbox
  module One
    module Helper #:nodoc:
      module_function

      include Toolbox::Helper

      def take_action_a(arg)
        "#{arg} blah A"
      end

      def take_action_b(arg)
        "#{arg} blah B"
      end
    end
  end
end
