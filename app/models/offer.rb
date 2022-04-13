class Offer < ApplicationRecord
  monetize :payout_cents

  validates :title,
    presence: true

  validates :points,
    presence: true,
    numericality: { :greater_than_or_equal_to => 0 }

  validates :payout,
    presence: true,
    numericality: { :greater_than_or_equal_to => 0 }

end
