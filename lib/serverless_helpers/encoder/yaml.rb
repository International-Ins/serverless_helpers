require 'yaml'

module ServerlessHelpers::Encoder
  class Yaml < Base
    def encode(data)
      YAML.dump(data)
    end

    def decode(data)
      YAML.load(data)
    end

    def binary?
      false
    end
  end
end