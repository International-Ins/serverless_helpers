RSpec.describe ServerlessHelpers::Event::Parser::Base do
  let (:parser) { described_class.new({}) }

  it "stubs encoding" do
    expect{parser.encode('')}.to raise_error(NotImplementedError)
  end

  it "stubs decoding" do
    expect{parser.decode('')}.to raise_error(NotImplementedError)
  end
end
