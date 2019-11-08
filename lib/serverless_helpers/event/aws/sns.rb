require 'ostruct'

module ServerlessHelpers::Event::Aws
  class Sns < ServerlessHelpers::Event::Base
    def messages()
      record_notifications.collect do |r|
        Message.new(subject: r['Subject'], message: parse(r['Message']))
      end
    end

    private

    def records
      @event['Records']
    end

    def record_notifications
      records.collect { |r| r['Sns'] }
    end

    def parse(message)
      ServerlessHelpers.config.event.parser.decode(message)
    end

    class Message < OpenStruct; end
  end
end