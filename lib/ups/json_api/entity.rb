# frozen_string_literal: true

module UPS
  module JsonApi
    module Entity
      module ClassMethods
        def attribute(name, key)
          define_method(name) do
            return unless @attributes.key?(key)

            value = @attributes[key]
            block_given? ? yield(value) : value
          end
        end

        def has_many(name, key, klass) # rubocop:disable Naming/PredicateName
          define_method(name) do
            return unless attributes.key?(key)

            instance_variable = "@#{name}".to_sym
            cached_value = instance_variable_get(instance_variable)
            return cached_value unless cached_value.nil?

            values = [attributes[key]].flatten.compact.map do |attributes|
              klass.new(attributes)
            end
            instance_variable_set(instance_variable, values)
          end
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end

      attr_reader :attributes

      def initialize(attributes)
        raise ArgumentError, 'Attributes must be a Hash' unless attributes.is_a?(Hash)

        @attributes = attributes
      end
    end
  end
end
