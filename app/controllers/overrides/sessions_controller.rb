# frozen_string_literal: true

module Overrides
  # Override session controller
  class SessionsController < DeviseTokenAuth::SessionsController
    def render_create_success
      render_resource(@resource)
    end
  end
end
