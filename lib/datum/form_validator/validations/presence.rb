# frozen_string_literal: true

module Datum
  module FormValidator
    module Validations
      class Presence
        def call(name, value)
          valid?(value) ? {} : { error: :required, on: name }
        end

        private

        def valid?(value)
          present?(value)
        end

        def present?(value)
          !value
            .to_s
            .empty?
        end
      end
    end
  end
end
