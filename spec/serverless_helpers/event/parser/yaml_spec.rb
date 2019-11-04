RSpec.describe ServerlessHelpers::Event::Parser::Yaml do
  let (:parser) { described_class.new }
  let (:plain_message) { {foo: :bar, baz: 123, bool: true} }
  let (:yaml_message) { "---\n:foo: :bar\n:baz: 123\n:bool: true\n" }

  it "does nothing when encoding" do
    expect(parser.encode(plain_message)).to eql yaml_message
  end

  it "does nothing when decoding" do
    expect(parser.decode(yaml_message)).to eql plain_message
  end
end
