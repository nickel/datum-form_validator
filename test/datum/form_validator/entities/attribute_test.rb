# frozen_string_literal: true

require "test_helper"

module Datum
  module FormValidator
    class AttributeTest < Minitest::Test
      def setup
        @attribute = Attribute.new
      end

      def test_starts_with_black_attributes
        assert_nil @attribute.name
      end

      def test_supports_reading_and_writting_a_name
        @attribute.name = "foo"
        assert_equal "foo", @attribute.name
      end

      def test_valid_method_validates_a_proper_value
        @attribute.value = "bar"
        @attribute.validations = [Validations::Presence.new]

        assert @attribute.valid?
        assert_empty @attribute.errors
      end

      def test_valid_method_validates_an_improper_value
        @attribute.value = ""
        @attribute.validations = [Validations::Presence.new]

        refute @attribute.valid?
        refute_empty @attribute.errors
      end

      def test_valid_method_validates_when_no_validations
        assert @attribute.valid?
        assert_empty @attribute.errors
      end
    end
  end
end
