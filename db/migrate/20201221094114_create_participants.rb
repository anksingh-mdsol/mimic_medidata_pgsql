# frozen_string_literal: true

class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.string :name
      t.integer :age
      t.string :gender

      t.timestamps
    end
  end
end
