# frozen_string_literal: true

# Home Controller
class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    render json: {
      data: {
        message: "Welcome #{current_user.email}",
        user: current_user
      }
    }, status: 200
  end
end
