module Api
  module V1
    class ServicesController < BaseController
      def show
        @service = Service.find(params[:id])
        render json: @service
      end
    end
  end
end
