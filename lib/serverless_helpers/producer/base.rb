module ServerlessHelpers::Producer
  class Base
    def initialize(options)
      @options = options
    end

    def publish(message)
      raise NotImplementedError.new("#{self.class}#publish is not yet implemented.")
    end

    private

    def encode(message)
      parser.encode(message)
    end

    def parser
      ServerlessHelpers.config.event.parser
    end
  end
end