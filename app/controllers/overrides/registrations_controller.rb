# frozen_string_literal: true

module Overrides
  # Override registration controller
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    def render_create_success
      render_resource(@resource)
    end
  end
end
