class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.string :title
      t.string :header
      t.text :description
      t.integer :points
      t.integer :payout_cents

      t.timestamps
    end
  end
end
