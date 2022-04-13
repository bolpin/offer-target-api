class CreateOperatingSystems < ActiveRecord::Migration[7.0]
  def change
    create_table :operating_systems do |t|
      t.string :name

      t.timestamps
    end
  end
end
