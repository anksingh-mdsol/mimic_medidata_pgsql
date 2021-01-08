class AddArmsToClinc < ActiveRecord::Migration[6.1]
  def change
    add_reference :arms, :clinic
  end
end
