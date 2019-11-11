module ServerlessHelpers::Source
  class Base
    def initialize(options)
      @options = options
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