require 'serverless_helpers/source/shared_examples'

RSpec.describe ServerlessHelpers::Source::Kafka::Topic do
  before do
    ServerlessHelpers.configure do |config|
    end
  end

  let (:kafka) { double('kafka') }
  let (:source) { described_class.new({}, kafka: kafka) }
  let (:args) { {subject: 'my_subject', message: 'my_message'} }

  include_examples "servless_helpers/source/shared_examples"

  it "passes publish to AWS" do
    expect(kafka).to receive(:deliver_message).with("my_message", {:partition_key=>"default", :topic=>"my_subject"})
    source.publish(args)
  end

  it "accepts custom partition key" do
    expect(kafka).to receive(:deliver_message).with("my_message", {:partition_key=>"custom", :topic=>"my_subject"})
    source.publish(args.merge(partition_key: 'custom'))
  end

  it "does not implement subscribe" do
    expect(kafka).to receive(:each_message).and_return([])
    source.subscribe(subject: 'my_subject')
  end

  it "returns events from subscription" do
    expect(kafka).to receive(:each_message).and_yield({}).and_yield({})
    count = 0
    source.subscribe(subject: 'my_subject') do |message|
      expect(message).to be_kind_of ServerlessHelpers::Event::Base
      count = count + 1
    end
    expect(count).to eq 2
  end

  it "implements decode_event" do
    source.decode_event({}) do |evt|
      expect(evt).to be_kind_of ServerlessHelpers::Event::Base
    end
  end
end
