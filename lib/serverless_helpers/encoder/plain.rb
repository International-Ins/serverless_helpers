module ServerlessHelpers::Encoder
  class Plain < Base
    def encode(data)
      data
    end

    def decode(data)
      data
    end

    def binary?
      false
    end
  end
end