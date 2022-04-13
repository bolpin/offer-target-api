class CreateOfferTargets < ActiveRecord::Migration[7.0]
  def change
    create_table :offer_targets do |t|
      t.references :offer, null: false
      t.integer :min_player_age
      t.integer :max_player_age
      t.references :operating_system, null: false
      t.integer :min_os_major_version
      t.integer :min_os_minor_version
      t.integer :min_os_patch_version
      t.references :locale, null: false
      t.references :gender, null: false

      t.timestamps
    end
  end
end
