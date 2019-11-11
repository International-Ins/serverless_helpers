require 'serverless_helpers/encoder/shared_examples'

RSpec.describe ServerlessHelpers::Encoder::Base do
  let(:parser) { described_class.new({}) }
  # For sub-classes:
  # include_examples "servless_helpers/encoder/shared_examples"
end
