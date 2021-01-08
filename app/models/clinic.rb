# frozen_string_literal: true

class Clinic < ApplicationRecord
    has_many :arms
    validates :name, uniqueness: {case_sensitive: false}
end
