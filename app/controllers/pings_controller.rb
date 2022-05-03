class PingsController < ApplicationController
  def index
    version = File.read('pings_version').strip
    render json: { env: Rails.env, version: version }
  end
end
