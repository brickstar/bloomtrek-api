class Api::V1::TrailsController < ApplicationController
  before_action :validate_park, only: [:index]

  def index
    park = Park.find_by(id: params[:park_id])
    render json: park.trails
  end
end
