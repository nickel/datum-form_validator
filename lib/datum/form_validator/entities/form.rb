# frozen_string_literal: true

module Datum
  module FormValidator
    class Form
      attr_reader :attributes
      attr_writer :attribute_source

      def initialize
        @attributes = []
      end

      def new_attribute(*args)
        attribute_source.call(*args).tap do |attribute|
          attribute.form = self
        end
      end

      def add_attribute(attribute)
        attributes << attribute
      end

      private

      def attribute_source
        @attribute_source ||= Attribute.public_method(:new)
      end
    end
  end
end
