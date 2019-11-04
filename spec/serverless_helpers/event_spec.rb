RSpec.describe ServerlessHelpers::Event do
  before do
    module ServerlessHelpers::Event::Acme; end
    class ServerlessHelpers::Event::Acme::Mock < ServerlessHelpers::Event::Base; end
  end

  it "creates a sub-class given a specific type" do
    expect(described_class.for({}, type: :mock, provider: :acme)).to be_instance_of ServerlessHelpers::Event::Acme::Mock
  end
end
