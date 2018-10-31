class ApplicationController < ActionController::API
  def validate_park
    unless Park.find_by(id: params[:park_id])
      render status: 404
    end
  end

  def validate_scraper_params
    render status: 404 unless params[:website] && params[:csv_file_name]
  end
end
