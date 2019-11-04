RSpec.describe ServerlessHelpers do
  it "has a version number" do
    expect(ServerlessHelpers::VERSION).not_to be nil
  end

  it 'sets a default event_parser' do
    expect(described_class.config.event_parser).to be_kind_of ServerlessHelpers::Event::Parser::Base
  end
end
