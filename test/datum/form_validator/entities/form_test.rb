# frozen_string_literal: true

require "test_helper"
require "ostruct"

module Datum
  module FormValidator
    class FormTest < Minitest::Test
      def setup
        @form = Form.new
      end

      def test_with_no_attributes
        assert_empty @form.attributes
      end

      def test_add_new_attributes
        @new_attribute = OpenStruct.new
        @form.attribute_source = -> { @new_attribute }

        assert_equal @new_attribute, @form.new_attribute
      end

      def test_sets_the_attribute_form_reference_to_itself
        @form.attribute_source = -> { OpenStruct.new }

        assert_equal @form, @form.new_attribute.form
      end

      def test_accepts_an_attribute_hash_on_behalf_of_the_attribute_manager
        attribute_source = Minitest::Mock.new
        attribute_source.expect(:call, OpenStruct.new, [{ x: 42, y: "z" }])
        @form.attribute_source = attribute_source
        @form.new_attribute(x: 42, y: "z")
        attribute_source.verify
      end

      def test_adds_the_attribute_to_the_form
        attribute = Object.new

        @form.add_attribute(attribute)
        assert_includes @form.attributes, attribute
      end
    end
  end
end
