RSpec.shared_examples "servless_helpers/source/shared_examples" do
  it "implements the parser base interface" do
    expect(source).to respond_to(:publish)
    expect(source).to respond_to(:subscribe)
    expect(source).to respond_to(:decode_event)
  end
end