# frozen_string_literal:true

require "test_helper"

module Datum
  class FormValidatorTest < Minitest::Test
    def test_that_it_has_a_version_number
      refute_nil ::Datum::FormValidator::VERSION
    end
  end
end
