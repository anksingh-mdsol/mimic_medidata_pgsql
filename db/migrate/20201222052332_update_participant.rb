# frozen_string_literal: true

class UpdateParticipant < ActiveRecord::Migration[6.1]
  def change
    add_column :participants, :email, :string
  end
end
