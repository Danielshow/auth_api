# frozen_string_literal: true

module Overrides
  # Override session controller
  class SessionsController < DeviseTokenAuth::SessionsController
    def render_create_success
      profile = Profile.where(user_id: @resource.token_validation_response['id']).first
      response = {
        user: @resource.token_validation_response,
        profile: profile.as_json
      }
      render json: {
        message: 'success',
        token: JsonWebToken.encode(response)
      }
    end
  end
end
