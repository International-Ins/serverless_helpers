require 'serverless_helpers/source/shared_examples'

RSpec.describe ServerlessHelpers::Source::Base do
  let (:source) { described_class.new({}) }
  # For sub classes:
  # include_examples "servless_helpers/source/shared_examples"
end
