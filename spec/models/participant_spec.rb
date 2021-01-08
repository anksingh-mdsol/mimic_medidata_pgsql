# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Participant, type: :model do
  # describe 'attributes' do
  #   it 'does have a name' do
  #   end

  #   it 'does have age' do
  #   end

  #   it 'does have gender' do
  #   end
  # end
  context 'participant creation' do
    it 'does not create a participant if name is blank' do
      participant=build(:participant, name: '')
      expect(participant.valid?).to eq false
    end
    it 'does not create a participant if age is blank' do
      participant=build(:participant, age: '')
      expect(participant.valid?).to eq false
    end
    it 'does not create a participant if gender is blank' do
      participant=build(:participant, gender: '')
      expect(participant.valid?).to eq false
    end

    it 'does not create duplicate participant' do
      create(:participant, name: 'Ankita')
      participant = build(:participant, name: 'ankita')
      expect(participant.valid?).to eq false
    end
    
  end
end
