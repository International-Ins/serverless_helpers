require 'active_support'
require 'active_support/core_ext'

require "serverless_helpers/version"
require "serverless_helpers/event"

module ServerlessHelpers
  class Error < StandardError; end
  # Your code goes here...

  mattr_reader :config
  def self.configure
    @@config = Configuration.new
    yield config
  end

  def self.config
    @@config ||= Configuration.new
  end

  private

  class Configuration
    attr_accessor :event_parser

    def initialize
      @event_parser ||= Event::Parser::Plain.new
    end
  end
end
