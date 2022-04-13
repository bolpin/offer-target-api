class CreateLocales < ActiveRecord::Migration[7.0]
  def change
    create_table :locales do |t|
      t.string :code

      t.timestamps
    end
  end
end
