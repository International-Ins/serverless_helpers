require 'byebug'

module ServerlessHelpers::Event::Kafka
  class Topic < ServerlessHelpers::Event::Base
    def messages()
      [Message.new(@event)]
    end

    private

    def parse(message)
      ServerlessHelpers.config.event.parser.decode(message)
    end

    class Message
      def initialize(event)
        @event = event
      end

      def message
        ServerlessHelpers.config.event.parser.decode(@event.value)
      end

      def subject
        @event.topic
      end
    end
  end
end