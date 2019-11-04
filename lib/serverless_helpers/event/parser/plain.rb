module ServerlessHelpers::Event::Parser
  class Plain < Base
    def encode(data)
      data
    end

    def decode(data)
      data
    end
  end
end