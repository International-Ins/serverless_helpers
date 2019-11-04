RSpec.describe ServerlessHelpers::Event::Base do
  let (:event) { described_class.new({}) }
  it "stubs messages" do
    expect{event.messages}.to raise_error(NotImplementedError)
  end
end
