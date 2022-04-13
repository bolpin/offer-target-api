class RemoveGenderFromPlayers < ActiveRecord::Migration[7.0]
  def up
    remove_column :players, :gender
  end

  def down
    add_column :players, :gender, :string
  end
end
