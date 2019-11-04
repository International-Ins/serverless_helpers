require 'json'

RSpec.describe ServerlessHelpers::Event::Aws::Sns do
  let (:mock_event) { JSON.parse(file_fixture('aws/sns_event.json')) }
  let (:event) { described_class.new(mock_event) }
  it "lists messages" do
    expect(event.messages.count).to be 1
  end

  it "parses messages from JSON" do
    expect(event.messages[0].message).to eql "Test Message"
  end
end
