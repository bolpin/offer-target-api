class AddGenderIdToPlayer < ActiveRecord::Migration[7.0]
  def change
    add_reference :players, :gender
  end
end
