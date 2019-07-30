# frozen_string_literal: true

# app/controllers/overrides/omniauth_callbacks_controller.rb
module Overrides
  # Class omniauth
  class OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController
    after_action :update_auth_header, only: :omniauth_success
  end
end
