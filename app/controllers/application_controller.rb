class ApplicationController < ActionController::API
  def validate_park
    unless Park.find_by(id: params[:park_id])
      render status: 404
    end
  end
end
