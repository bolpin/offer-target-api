require 'utils'
class OfferTargetsController < ApplicationController
  include Utils
  before_action :set_offer_target, only: %i[ show edit update destroy ]

  # GET /offer_targets or /offer_targets.json
  def index
    @offer_targets = OfferTarget.all
    @min_version = '0.0.2'
    @max_version = '10.0'
    @ios_count = Device.with_os('ios').gr_eq_to_vers(parse_vers(@min_version)).ls_eq_to_vers(parse_vers(@max_version)).count
    @android_count = Device.with_os('android').gr_eq_to_vers(parse_vers(@min_version)).ls_eq_to_vers(parse_vers(@max_version)).count
  end

  # GET /offer_targets/1 or /offer_targets/1.json
  def show
  end

  # GET /offer_targets/new
  def new
    @offer_target = OfferTarget.new
  end

  # GET /offer_targets/1/edit
  def edit
  end

  # POST /offer_targets or /offer_targets.json
  def create
    @offer_target = OfferTarget.new(offer_target_params)

    respond_to do |format|
      if @offer_target.save
        format.html { redirect_to offer_target_url(@offer_target), notice: "Offer target was successfully created." }
        format.json { render :show, status: :created, location: @offer_target }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @offer_target.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offer_targets/1 or /offer_targets/1.json
  def update
    respond_to do |format|
      if @offer_target.update(offer_target_params)
        format.html { redirect_to offer_target_url(@offer_target), notice: "Offer target was successfully updated." }
        format.json { render :show, status: :ok, location: @offer_target }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @offer_target.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offer_targets/1 or /offer_targets/1.json
  def destroy
    @offer_target.destroy

    respond_to do |format|
      format.html { redirect_to offer_targets_url, notice: "Offer target was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer_target
      @offer_target = OfferTarget.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def offer_target_params
      params.require(:offer_target).permit(:offer_id, :min_player_age, :max_player_age, :operating_system_id, :min_os_major_version, :min_os_minor_version, :min_os_patch_version, :locale_id, :gender_id)
    end
end
