class Api::V1::DevicesController < ApplicationController
  def index
    render json: Device.all
  end

  def create
    device = Device.create(device_params)
    render json: device
  end

  def destroy
    Device.destroy(params[:id])
  end

  def update
    device = Device.find(params[:id])
    device.update_attributes(device_params)
    render json: device
  end

  def count
    @min_vers = device_count_params[:min_vers]
    @max_vers = device_count_params[:max_vers]
    @os = device_count_params[:os_id]
    count = [
      {
        count: Device.with_os(@os_id).gr_eq_to_vers(parse_vers(@min_vers)).ls_eq_to_vers(parse_vers(@max_vers)).count,
        os_id: @os_id,
        min_vers: @min_vers.to_s,
        max_vers: @max_vers.to_s
      }
    ]
    render json: count

  end

  private
    def device_params
      params.require(:device).permit(
        :first_name, :last_name, :birthdate, :gender_id
      )
    end

    def device_count_params
      params.require(:min_vers, :max_vers, :os_id)
    end

end

