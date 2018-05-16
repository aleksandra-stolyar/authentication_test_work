module Api
  module V1
    class ServicesController < ApplicationController
      skip_before_action :authenticate!
      def show
        @service = Service.find(params[:id])
        render json: @service
      end
    end
  end
end
