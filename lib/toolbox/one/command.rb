# frozen_string_literal: true

require 'toolbox/one/helper'

module Toolbox
  module One
    class Command #:nodoc:
      include Toolbox::One::Helper

      attr_reader :options, :argument

      def initialize(argument, options = {})
        @options = options
        @argument = argument
      end

      def call
        log_info("Command one with #{argument}")
        log_info("Option #{options[:dry]}")
        log_info("Option #{options[:verbose]}")
      end

      def render(data, tmpl)
        render_tmpl(data, tmpl)
      end
    end
  end
end
