require 'serverless_helpers/source/shared_examples'

RSpec.describe ServerlessHelpers::Source::Aws::Sns do
  before do
    ServerlessHelpers.configure do |config|
      config.aws.region = 'us-east-1'
      config.aws.arn = 'arn:foo:bar'
    end
  end

  let (:topic) { double('topic') }
  let (:source) { described_class.new({}, topic: topic) }
  let (:args) { {subject: 'my_subject', message: 'my_message'} }

  include_examples "servless_helpers/source/shared_examples"

  it "passes publish to AWS" do
    expect(topic).to receive(:publish).with(args)
    source.publish(args)
  end
end
