require 'logger'
require 'pathname'

module Toolbox # :nodoc:
  #
  # Singleton with global helpers
  #
  #

  class << self

    #
    # Logger object
    #
    attr_accessor :logger


    #
    # Verbosity flag
    #
    attr_accessor :verbose


    #
    # Dry run flag
    #
    attr_accessor :dry


    #
    # Create instance of logger object according to defined verbosity
    # @params [Boolean] this defines verbosity at runtime
    #                   if not provided then ENV['VERBOSE'] will be read
    #                   default: nil
    # @return [Logger]
    #
    def default_logger(v = nil)
      v = Toolbox.verbose  if v.nil?
      logger = Logger.new(STDOUT)
      logger.level = Logger::INFO
      logger.level = Logger::DEBUG if v
      logger
    end

    #
    # Find top level directory of gem development environment, this comes
    # handy during writing test cases
    # @return [String]
    #
    def source_root
      @source_root ||= Pathname.new(File.expand_path('../../', __FILE__))
    end

    #
    # Is this script attached to tty ?
    # @return [Boolean]
    #
    def tty?
      $stdout.tty?
    end
  end
end

Toolbox.verbose = ENV['VERBOSE'] ? true : false
Toolbox.dry = ENV['DRY'] ? true : false


Toolbox.logger = Toolbox.default_logger
