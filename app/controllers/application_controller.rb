class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found(error)
    render json: { error: error.to_s }, status: :not_found
  end
end
