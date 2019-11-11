require 'aws-sdk-sns'

module ServerlessHelpers::Producer::Aws
  class Sns < ServerlessHelpers::Producer::Base
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
  end
end