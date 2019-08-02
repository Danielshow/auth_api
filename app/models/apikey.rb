# frozen_string_literal: true

# ApiKey
class Apikey < ApplicationRecord
  validates :name, presence: true
  validates :key, presence: true
end
