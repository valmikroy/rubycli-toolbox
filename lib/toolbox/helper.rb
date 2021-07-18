# frozen_string_literal: true

require 'mixlib/shellout'
require 'erb'

require 'toolbox'

module Toolbox
  module Helper #:nodoc:
    module_function # avoid Mixin

    def log_info(msg)
      Toolbox.logger.info(msg)
    end

    def log_debug
      Toolbox.logger.debug(msg) if Toolbox.debug
    end

    def log_error
      Toolbox.logger.error(msg)
    end

    def shellout!(*command)
      cmd = Mixlib::ShellOut.new(*command)
      log_debug(c)
      cmd.timeout = 3600
      cmd.run_command
      cmd.error! # raises an exception to stop execution
      cmd.stdout
    end

    def exception
      out = ''
      begin
        out = yield
      rescue ToolboxError => e
        log_error(e.message)
        return nil
      end
      out
    end

    #
    # Class confines the scope of all variables used within ERB template
    #
    #
    class Template
      include ERB::Util
      attr_accessor :data, :template

      #
      # Initialize with Ruby hash and template string to render. Hash
      # data structure is coupled will its use in the ERB template.
      #
      # @params[Hash,String]
      #
      def initialize(data, template)
        @data = data
        @template = template
      end

      #
      # Returns rendered string
      # @return[String]
      #
      def render
        ERB.new(@template, nil, '-').result(binding)
      end
    end

    def render_tmpl(data, template)
      e = Template.new(data, template)
      e.render
    end
  end
end
