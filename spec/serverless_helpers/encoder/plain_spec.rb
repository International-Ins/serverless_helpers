require 'serverless_helpers/encoder/shared_examples'

RSpec.describe ServerlessHelpers::Encoder::Plain do
  let (:parser) { described_class.new }
  let (:message) { "This that and the other!  😈" }

  include_examples "servless_helpers/encoder/shared_examples"

  it "does nothing when encoding" do
    expect(parser.encode(message)).to eql message
  end

  it "does nothing when decoding" do
    expect(parser.decode(message)).to eql message
  end
end
