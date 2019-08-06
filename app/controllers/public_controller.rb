# frozen_string_literal: true

# Controller for assets
class PublicController < ApplicationController
  before_action :validates_key
  before_action :authenticate_user!
  def index
    @assets = PublicAsset.all
    render json: {
      assests: @assets
    }
  end
end
