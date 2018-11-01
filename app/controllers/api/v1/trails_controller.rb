class Api::V1::TrailsController < ApplicationController
  before_action :validate_park, only: [:index]
  before_action :set_trails, only: [:index]

  def index
    render json: @trails
  end

  def set_trails
    @trails = Park.find_by(id: params[:park_id]).trails
  end
end
