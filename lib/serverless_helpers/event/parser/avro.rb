require 'avro_turf'
require 'avro_turf/messaging'

module ServerlessHelpers::Event::Parser
  class Avro < Base
    def initialize(options: {})
      super
      @avro = AvroTurf::Messaging.new(@options)
    end

    def encode(data, options)
      @avro.encode(data, options)
    end

    def decode(data, options)
      @avro.decode(data, options)
    end
  end
end