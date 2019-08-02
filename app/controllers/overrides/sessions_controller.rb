# frozen_string_literal: true

module Overrides
  # Override session controller
  class SessionsController < DeviseTokenAuth::SessionsController
    def render_create_success
      render json: {
        message: 'success',
        token: JsonWebToken.encode(@resource.token_validation_response)
      }
    end
  end
end
