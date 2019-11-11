# Module for including parsers.
# Requires specific implementation from service providing the event.

require 'serverless_helpers/encoder/base'
require 'serverless_helpers/encoder/plain'
require 'serverless_helpers/encoder/yaml'
require 'serverless_helpers/encoder/avro'

module ServerlessHelpers::Encoder
end
