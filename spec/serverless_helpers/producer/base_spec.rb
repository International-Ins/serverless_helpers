RSpec.describe ServerlessHelpers::Producer::Base do
  let (:event) { described_class.new({}) }
  it "stubs publish" do
    expect{event.publish('my_message')}.to raise_error(NotImplementedError)
  end
end
