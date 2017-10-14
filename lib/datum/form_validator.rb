# frozen_string_literal: true

require "datum/form_validator/version"
require "datum/form_validator/validations/presence"

module Datum
  module FormValidator
    autoload :Attribute, "datum/form_validator/entities/attribute"
    autoload :Form, "datum/form_validator/entities/form"
  end
end
