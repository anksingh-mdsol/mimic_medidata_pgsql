class AddParticipantsToArm < ActiveRecord::Migration[6.1]
  def change
    add_reference :participants, :arm
  end
end
