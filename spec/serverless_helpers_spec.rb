RSpec.describe ServerlessHelpers do
  it "has a version number" do
    expect(ServerlessHelpers::VERSION).not_to be nil
  end

  it 'sets a default event_parser' do
    expect(described_class.config.event.parser).to be_kind_of ServerlessHelpers::Event::Parser::Base
  end

  it 'allows event parser config via symbols' do
    described_class.config.event.parser = :yaml
    expect(described_class.config.event.parser).to be_kind_of ServerlessHelpers::Event::Parser::Yaml
  end

  it 'raises NameError for unfound parsers' do
    expect{described_class.config.event.parser = :does_not_exist}.to raise_error(NameError)
  end

  it 'raises ArgumentError for mismatch parsers' do
    expect{described_class.config.event.parser = String.new()}.to raise_error(ArgumentError)
  end
end
