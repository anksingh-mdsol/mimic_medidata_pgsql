# frozen_string_literal: true

class Participant < ApplicationRecord
  belongs_to :arm , optional: true
  validates_associated :arm
  validates :name, :age, :gender, presence: true
  validates :gender, inclusion: { in: %w[Male Female], message: 'Either male or female' }
 #validates :name, uniqueness: {case_sensitive: false}
  validates :age, numericality: { only_integer: true }
  #validates_format_of :name, :with => /\A[a-zA-Z\s]+\Z/
  before_validation :method_before_validation
  after_validation :method_after_validattion

  private

  def method_before_validation
    self.gender = 'Male' if gender.downcase.in? %w[male m]
    self.gender = 'Female' if gender.downcase.in? %w[female f]

    #puts 'Before validation'
  end

  def method_after_validattion
    #puts 'After Validation'
  end
end
