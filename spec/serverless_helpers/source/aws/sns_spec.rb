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

  it "does not implement subscribe" do
    expect{source.subscribe()}.to raise_error(NoMethodError)
  end

  it "implements decode_event" do
    source.decode_event({}) do |evt|
      expect(evt).to be_kind_of ServerlessHelpers::Event::Base
    end
  end
end
