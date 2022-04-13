class RemovePayoutCentsFromOffers < ActiveRecord::Migration[7.0]
  def up
    remove_column :offers, :payout_cents
  end

  def down
    add_column :offers, :payout_cents, :integer
  end
end
