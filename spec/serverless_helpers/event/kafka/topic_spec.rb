require 'json'

RSpec.describe ServerlessHelpers::Event::Kafka::Topic do
  let (:mock_event) { double('event') }
  let (:event) { described_class.new(mock_event) }

  it "lists messages" do
    expect(event.messages.count).to be 1
  end

  it "parses messages from JSON" do
    expect(mock_event).to receive(:value).and_return("Test Message")
    expect(event.messages[0].message).to eql "Test Message"
  end
end
