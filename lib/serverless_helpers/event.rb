# Base class for handling events.
# Requires specific implementation from service providing the event.

require 'serverless_helpers/event/base'
require 'serverless_helpers/event/aws'

module ServerlessHelpers
  class Event
    def self.for(event, provider:, type:)
      return class_for(provider, type).new(event)
    end

    private

    def self.class_for(provider, type)
      "#{self}::#{provider.to_s.camelize}::#{type.to_s.camelize}".constantize
    end
  end
end
