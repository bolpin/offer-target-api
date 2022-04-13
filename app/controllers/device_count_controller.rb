require 'utils'

class DeviceCountController < ApplicationController
  include Utils

  def index
    # sleep(1)
    # render :status => 404
    # return
    @os = params[:os] || 'android'
    @min_vers = params[:min_vers] || '0.0.0'
    @max_vers = params[:max_vers] || '9999.9999.9999'
    @count = [
      {
        count: Device.with_os(@os).gr_eq_to_vers(parse_vers(@min_vers)).ls_eq_to_vers(parse_vers(@max_vers)).count,
        os: @os,
        min_vers: @min_vers.to_s,
        max_vers: @max_vers.to_s
      }
    ]
  end
end
