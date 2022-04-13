class AddPayoutToOffers < ActiveRecord::Migration[7.0]
  def change
    add_monetize :offers, :payout
  end
end
