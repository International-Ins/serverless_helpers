RSpec.describe ServerlessHelpers::Producer::Aws::Sns do
  before do
    ServerlessHelpers.configure do |config|
      config.aws.region = 'us-east-1'
      config.aws.arn = 'arn:foo:bar'
    end
  end

  let (:topic) do
    mock = double('topic')
    expect(mock).to receive(:publish).with(args)
    mock
  end

  let (:event) { described_class.new({}, topic: topic) }
  let (:args) { {subject: 'my_subject', message: 'my_message'} }

  it "passes publish to AWS" do
    event.publish(args)
  end
end
