require 'rails_helper'

RSpec.describe ParticipantsController, type: :controller do

    describe '#index' do
    end


    describe '#create' do
        binding.pry
        let(:clinic) {create(:clinic)}
       let(:arm) {create(:arm)}

        context 'when valid params are provided' do
            let(:valid_params){ {
               participant: {
                name: 'John',
                gender: 'Female',
                age: 23,
                arm_id: arm.id,
                clinic_id: arm.clinic_id
            },
            arm_id: arm.id,
                clinic_id: arm.clinic_id
            }
             }
            it 'does create a participant' do
                post :create, params: valid_params
                expect(Participant.count).to eq(1)
            end
        end

        context 'when invalid valid params are provided' do
            let(:invalid_params){{ 
               participant: { 
                name: 'John',
                gender: 'Female',
                age:'',
                arm_id: arm.id,
                clinic_id: arm_clinic_id
               },
                arm_id: arm.id,
                clinic_id: arm.clinic_id
                }
             }
            it 'does not create a participant' do
                post :create, params: invalid_params
                expect(Participant.count).to eq(0)
            
            end
        end
    end



end