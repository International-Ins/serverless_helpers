require 'aws-sdk-sns'

module ServerlessHelpers::Source::Aws
  class Sns < ServerlessHelpers::Source::Base
    def initialize(options, region: ServerlessHelpers.config.aws.region, topic_arn: ServerlessHelpers.config.aws.arn, topic: nil)
      super(options)
      @topic = topic || Aws::SNS::Resource.new(region: region).topic(topic_arn)
      raise ArgumentError.new(
        "SNS Does not support binary encoding from #{parser.class}"
      ) if parser.binary?
    end

    def publish(subject:, message:)
      @topic.publish({
        subject: subject,
        message: encode(message),
      })
    end

    def subscribe()
      raise NoMethodError.new("#{self.class} requires subscription through AWS itself (Lambda?).  Did you mean #decode_event ?")
    end

    def decode_event(raw_event)
      yield ServerlessHelpers::Event.for(raw_event)
    end
  end
end