require 'kafka'

module ServerlessHelpers::Source::Kafka
  class Topic < ServerlessHelpers::Source::Base
    def initialize(options, brokers: ServerlessHelpers.config.kafka.brokers, client_id: ServerlessHelpers.config.kafka.client_id, kafka: nil)
      super(options)
      @kafka = kafka || Kafka.new(brokers, client_id)
    end

    def publish(subject:, message:, partition_key:"default")
      @kafka.publish(encode(message), {topic: subject, partition_key: partition_key})
    end

    def subscribe(topic:, &block)
      @kafka.each_message(topic: topic) do |raw_event|
        decode_event(raw_event, &block)
      end
    end

    def decode_event(raw_event)
      yield ServerlessHelpers::Event.for(raw_event)
    end
  end
end