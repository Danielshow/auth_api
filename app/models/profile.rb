# frozen_string_literal: true

# Profile model
class Profile < ApplicationRecord
  belongs_to :user

  validate :gender_validate

  before_save :gender_downcase

  def gender_downcase
    self.gender&.downcase if self.gender
  end

  def gender_validate
    gender_choice = %i[male female]
    if self.gender
      unless gender_choice.include? gender&.downcase&.to_sym
        errors.add(:gender, 'should be male or female')
      end
    end
  end
end
