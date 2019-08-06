# frozen_string_literal: true

module Overrides
  # Override registration controller
  class PasswordsController < DeviseTokenAuth::PasswordsController
    skip_before_action :validates_key, except: %I[create]
  end
end
