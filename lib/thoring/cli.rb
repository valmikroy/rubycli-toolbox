require 'thor'
require 'thoring'


module Thoring
  class CLI < Thor

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

      method_option :example_option,
                    aliases: ['-e', '--example_option'],
                    desc: 'Specifications dir, default: skelcli_default_value',
                    type: :string,
                    default: 'skelcli_default_value'
    end

    desc 'command <command arg>', 'Example command'
    global_options
    def command(command_arg)
      puts "my command one" 
    end

  end

end

