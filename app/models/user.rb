# frozen_string_literal: true

# USer model
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :trackable, :rememberable, :validatable,
         omniauth_providers: %I[facebook google]
  include DeviseTokenAuth::Concerns::User
end
