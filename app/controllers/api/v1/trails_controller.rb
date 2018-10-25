class Api::V1::TrailsController < ApplicationController
  def index
    park = Park.find_by(id: params[:park_id])
    if park
      render json: park.trails
    else
      render status: 404
    end
  end
end
