require 'serverless_helpers/event/parser/shared_examples'

RSpec.describe ServerlessHelpers::Event::Parser::Base do
  let(:parser) { described_class.new({}) }
  # For sub-classes:
  # include_examples "servless_helpers/event/parser/shared_examples"
end
