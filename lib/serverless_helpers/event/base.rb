# Base class for event types.
module ServerlessHelpers
  class Event
    class Base
      def initialize(event)
        @event = event
      end

      def messages()
        raise NotImplementedError.new("#{self.class}#messages not implemented")
      end
    end
  end
end