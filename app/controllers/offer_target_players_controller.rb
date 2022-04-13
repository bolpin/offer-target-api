class OfferTargetPlayersController < ApplicationController
  def index
    @offer_target = OfferTarget.find(params[:offer_target_id])
    @players = Player.all_matching_target_offer(@offer_target)
  end
end


