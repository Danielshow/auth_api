# frozen_string_literal: true

# Application controller
class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  def render_resource(resource)
    if resource&.errors&.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
        {
          status: '400',
          title: 'Bad Request',
          message: resource.errors
        }
      ]
    }, status: :bad_request
  end

  def not_found
    render json: {
      errors: [
        {
          status: '404',
          message: 'Not found'
        }
      ]
    }, status: :not_found
  end
end
