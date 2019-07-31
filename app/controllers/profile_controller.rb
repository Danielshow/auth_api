# frozen_string_literal: true

# Profile controller
class ProfileController < ApplicationController
  before_action :authenticate_user!

  def index
    profile = Profile.where(user_id: current_user.id).first
    render_resource(profile)
  rescue ActiveRecord::RecordNotFound => e
    not_found
  end

  def create
    is_profile = Profile.where(user_id: current_user.id).first
    render_resource(is_profile) if is_profile
  rescue ActiveRecord::RecordNotFound
    profile = Profile.create(
      name: params['name'],
      gender: params['gender'],
      address: params['address'],
      user: current_user
    )
    render_resource(profile)
  end

  def update
    profile = Profile.where(user_id: current_user.id).first
    profile.name = params['name'] || profile.name
    profile.gender = params['gender'] || profile.gender
    profile.address = params['address'] || profile.address
    profile.save
    render_resource(profile)
  rescue NoMethodError => e
    not_found
  end
end