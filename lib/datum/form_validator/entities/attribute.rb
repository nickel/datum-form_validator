# frozen_string_literal: true

require_relative "../validations/presence"

module Datum
  module FormValidator
    class Attribute
      class ValidationError < StandardError; end

      attr_accessor :form, :name, :value, :validations, :errors

      def initialize(attrs = {})
        @name = attrs[:name]
        @value = attrs[:value]
        @validations = attrs.fetch(:validations, [])
      end

      def valid?
        validate!
        true
      rescue ValidationError
        false
      end

      private

      def validate!
        @errors =
          validations
            .map { |validation| validation.call(name, value) }
            .delete_if(&:empty?)

        raise ValidationError unless errors.empty?
      end
    end
  end
end
