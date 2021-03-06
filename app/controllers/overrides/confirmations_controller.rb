# frozen_string_literal: true

module Overrides
  # Override registration controller
  class ConfirmationsController < DeviseTokenAuth::ConfirmationsController
    skip_before_action :validates_key
  end
end
