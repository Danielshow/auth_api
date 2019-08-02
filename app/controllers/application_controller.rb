#ppl frozen_string_literal: true

# Application controller
class ApplicationController < ActionController::API
  before_action :validates_key
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::MimeResponds
  def render_resource(resource)
    if resource&.errors&.empty?
      render json: {
        message: 'success',
        token: JsonWebToken.encode(resource.as_json)
      }
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

  def validates_key
    unless params[:apikey]
      return render json: {
        message: 'No Api key found'
      }, status: :bad_request
    end
    key = Apikey.where(key: params[:apikey]).first
    not_found unless key
  end
end
