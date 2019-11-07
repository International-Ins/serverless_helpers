require 'avro_turf'
require 'avro_turf/test/fake_confluent_schema_registry_server'
require 'webmock/rspec'

RSpec.describe ServerlessHelpers::Event::Parser::Avro do
  def define_schema(path, content)
    File.open(File.join("spec/schemas", path), "w") do |f|
      f.write(content)
    end
  end

  let(:registry_url) { "http://registry.example.com" }
  let(:client_cert) { "test client cert" }
  let(:client_key) { "test client key" }
  let(:client_key_pass) { "test client key password" }
  let(:logger) { Logger.new(StringIO.new) }

  let(:parser) {
    described_class.new(options: {
      registry_url: registry_url,
      schemas_path: "spec/schemas",
      logger: logger,
      client_cert: client_cert,
      client_key: client_key,
      client_key_pass: client_key_pass
    })
  }

  let(:message) { { "full_name" => "John Doe" } }
  # Required to add the schema to the registry.
  let(:avro_message) { parser.encode(message, schema_name: schema_name) }
  let(:schema_name) { "person" }
  let(:schema_json) do
    <<-AVSC
      {
        "name": "#{schema_name}",
        "type": "record",
        "fields": [
          {
            "type": "string",
            "name": "full_name"
          }
        ]
      }
    AVSC
  end
  let(:schema) { Avro::Schema.parse(schema_json) }

  before do
    FileUtils.mkdir_p("spec/schemas")
    stub_request(:any, /^#{registry_url}/).to_rack(FakeConfluentSchemaRegistryServer)
    FakeConfluentSchemaRegistryServer.clear
    define_schema "#{schema_name}.avsc", schema_json
  end

  it "encodes consistently" do
    expect(parser.encode(message, {schema_name: schema_name})).to eql avro_message
  end

  it "decodes consistently" do
    expect(parser.decode(avro_message, {schema_name: schema_name})).to eql message
  end
end
