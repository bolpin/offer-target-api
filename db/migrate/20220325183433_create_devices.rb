class CreateDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :devices do |t|
      t.string :model
      t.string :os
      t.integer :os_major_version
      t.integer :os_minor_version
      t.integer :os_patch_version
      t.string :locale

      t.timestamps
    end
  end
end
