class AddOperatingSystemIdToDevices < ActiveRecord::Migration[7.0]
  def change
    add_reference :devices, :operating_system
  end
end
