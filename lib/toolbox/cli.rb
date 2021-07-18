# frozen_string_literal: true

require 'thor'

module Toolbox
  class CLI < Thor # :nodoc:
    def self.exit_on_failure?
      true
    end

    def self.global_options
      method_option :verbose,
                    aliases: ['-v', '--verbose'],
                    desc: 'Turn on verbosity , default: false',
                    type: :boolean,
                    default: false
      method_option :dry,
                    aliases: ['-d', '--dry'],
                    desc: 'Dry run, default: false',
                    type: :boolean,
                    default: false
    end

    desc 'command <command arg>', 'Example command'
    def command(_command_arg)
      puts @namespace
      puts 'my command '
    end
  end
end
