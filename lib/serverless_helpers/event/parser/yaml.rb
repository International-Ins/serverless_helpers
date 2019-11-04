require 'yaml'

module ServerlessHelpers::Event::Parser
  class Yaml < Base
    def encode(data)
      YAML.dump(data)
    end

    def decode(data)
      YAML.load(data)
    end
  end
end