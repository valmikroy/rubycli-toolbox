# frozen_string_literal: true

require 'toolbox/cli'
require 'toolbox/one/command'

module Toolbox
  module One
    class CLI < Toolbox::CLI #:nodoc:
      desc 'clione <command arg>', 'Example command'
      global_options
      def clione(command_arg)
        Toolbox::One::Command.new(command_arg, options).call
      end
    end
  end
end
