# frozen_string_literal: true

require "test_helper"

module Datum
  module FormValidator
    module Validations
      class PresenceTest < Minitest::Test
        def setup
          @validation = Presence
        end

        def test_does_not_return_any_error_when_value_is_present
          error = @validation.new.call("foo", "bar")
          assert_equal({}, error)
        end

        def test_returns_an_error_when_value_is_nil
          error = @validation.new.call("foo", nil)
          assert_equal({ error: :required, on: "foo" }, error)
        end

        def test_returns_an_error_when_value_is_empty
          error = @validation.new.call("foo", "")
          assert_equal({ error: :required, on: "foo" }, error)
        end
      end
    end
  end
end
