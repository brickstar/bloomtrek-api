class Api::V1::FlowersController < ApplicationController
  before_action :validate_park, only: [:index]
  before_action :set_park, only: [:index]

  def index
    flowers = @park.flowers.where("bloom_start <= ? AND bloom_end >= ?", params[:month], params[:month])
    render json: flowers
  end

  private

  def set_park
    @park = Park.find_by(id: params[:park_id])
  end
end
