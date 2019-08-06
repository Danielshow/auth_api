# frozen_string_literal: true

module Overrides
  # Override registration controller
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    def render_create_success
      binding.pry
      Profile.create(user_id: @resource.token_validation_response['id'])
      render json: {
        message: 'success',
        token: JsonWebToken.encode(@resource.token_validation_response)
      }
    end
  end
end
