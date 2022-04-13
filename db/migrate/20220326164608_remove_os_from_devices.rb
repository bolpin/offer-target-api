class RemoveOsFromDevices < ActiveRecord::Migration[7.0]
  def up
    remove_column :devices, :os
  end

  def down
    add_column :devices, :os, :string
  end
end
