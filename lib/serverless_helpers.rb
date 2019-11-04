require 'active_support'
require 'active_support/core_ext'

require 'dry-configurable'

require "serverless_helpers/version"
require "serverless_helpers/event"

module ServerlessHelpers
  class Error < StandardError; end

  extend Dry::Configurable
  setting :event_parser, Event::Parser::Plain.new
end
