class Api::V1::PlayersController < ApplicationController
  def index
    render json: Player.all
  end

  def create
    player = Player.create(player_params)
    render json: player
  end

  def destroy
    Player.destroy(params[:id])
  end

  def update
    player = Player.find(params[:id])
    player.update_attributes(player_params)
    render json: player
  end

  private
    def player_params
      params.require(:player).permit(
        :first_name, :last_name, :birthdate, :gender_id
      )
    end

end

