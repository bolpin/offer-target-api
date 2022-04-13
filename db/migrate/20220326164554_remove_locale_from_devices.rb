class RemoveLocaleFromDevices < ActiveRecord::Migration[7.0]
  def up
    remove_column :devices, :locale
  end

  def down
    add_column :devices, :locale, :string
  end
end
