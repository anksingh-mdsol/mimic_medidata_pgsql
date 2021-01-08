class Arm < ApplicationRecord
    belongs_to :clinic
    has_many :participants
    validates :limit, numericality: {only_integer: true}
    validates_length_of :participants, maximum: :limit
end
