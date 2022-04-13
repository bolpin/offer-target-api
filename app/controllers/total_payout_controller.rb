class TotalPayoutController < ApplicationController
  def index
    # sleep(1)
    @min_age = params[:min_age] || 1
    @max_age = params[:max_age] || 100
    @payout = [
      {
        amount: OfferTarget.total_payout(@min_age, @max_age),
        min_age: @min_age.to_s,
        max_age: @max_age.to_s
      }
    ]
  end
end
