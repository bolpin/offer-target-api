class AddLocaleIdToDevices < ActiveRecord::Migration[7.0]
  def change
    add_reference :devices, :locale
  end
end
