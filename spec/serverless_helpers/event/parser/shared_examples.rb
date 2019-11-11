RSpec.shared_examples "servless_helpers/event/parser/shared_examples" do
  it "implements the parser base interface" do
    expect(parser).to respond_to(:encode)
    expect(parser).to respond_to(:decode)
    expect(parser).to respond_to(:binary?)
  end
end