require 'avro_turf'
require 'avro_turf/messaging'

module ServerlessHelpers::Event::Parser
  class Avro < Base
    def initialize(options: {})
      super
      @avro ||= options[:avro] || AvroTurf::Messaging.new(@options.excluding(:schema_name))
    end

    def encode(data)
      @avro.encode(data, schema_name: @options[:schema_name])
    end

    def decode(data)
      @avro.decode(data, schema_name: @options[:schema_name])
    end

    def binary?
      true
    end
  end
end