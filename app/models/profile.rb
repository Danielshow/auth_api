# frozen_string_literal: true

# Profile model
class Profile < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :gender, presence: true
  validates :address, presence: true

  validate :gender_validate

  before_save :gender_downcase

  def gender_downcase
    self.gender.downcase!
  end

  def gender_validate
    gender_choice = %i[male female]
    unless gender_choice.include? gender.downcase.to_sym
      errors.add(:gender, 'should be male or female')
    end
  end
end
