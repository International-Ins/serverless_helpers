# Module for including parsers.
# Requires specific implementation from service providing the event.

require 'serverless_helpers/event/parser/base'
require 'serverless_helpers/event/parser/plain'
require 'serverless_helpers/event/parser/yaml'

module ServerlessHelpers::Event::Parser
end
