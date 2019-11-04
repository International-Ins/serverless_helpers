module ServerlessHelpers::Event::Parser
  class Base
    def initialize(options: {})
      @options = options
    end

    def encode(data)
      raise NotImplementedError.new("#{self.class}#encode has not been implemented!")
    end

    def decode(data)
      raise NotImplementedError.new("#{self.class}#decode has not been implemented!")
    end
  end
end