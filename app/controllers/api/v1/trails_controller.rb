class Api::V1::TrailsController < ApplicationController
  def index
    park = Park.find(params[:park_id])
    render json: park.trails
  end
end
