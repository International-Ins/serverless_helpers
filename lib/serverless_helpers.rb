require 'active_support'
require 'active_support/core_ext'

require 'dry-configurable'

require "serverless_helpers/version"
require "serverless_helpers/event"
require "serverless_helpers/producer"

module ServerlessHelpers
  class Error < StandardError; end

  extend Dry::Configurable
  setting :event do
    setting(:parser, :plain) do |value|
      SymbolToClassParser.call(
        argument: value,
        type: :event,
        namespace: :parser,
        base_class: ServerlessHelpers::Event::Parser::Base
      )
    end
    setting :provider
    setting :type
  end

  setting :aws do
    setting :region
    setting :arn
  end

  private
  
  class SymbolToClassParser
    def self.call(argument:, type:, namespace:, base_class:)
      if argument.is_a? Symbol
        create_class(type, namespace, argument).new
      elsif argument.is_a? base_class
        argument
      else
        raise ArgumentError.new("Object, #{argument}, is not a sub-class of #{base_class.name}.")
      end
    rescue NameError => e
      raise NameError.new("Could not find #{argument} in namespace #{namespace_for(type, namespace)}: #{e.message}")
    end

    private

    def self.create_class(type, namespace, class_name)
      "#{namespace_for(type, namespace)}::#{to_camel(class_name)}".constantize
    end

    def self.namespace_for(type, namespace)
      "ServerlessHelpers::#{to_camel(type)}::#{to_camel(namespace)}"
    end

    def self.to_camel(sym)
      "#{sym.to_s.camelize}"
    end
  end
end
