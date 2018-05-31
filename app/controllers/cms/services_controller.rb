module Cms
  class ServicesController < ApplicationController
    def index
      @services= if current_user.is_user?
        current_user.services
      else
        Service.all
      end
    end

    def grant_access
      @service = Service.find(params[:id])
    end

    def edit
      @service = Service.find(params[:id])
    end

    def update
      @service = Service.find(params[:id])
      if @service.update_attributes(service_params)
        redirect_to cms_services_url
      else
        render 'edit'
      end
    end

    private

    def service_params
      params.require(:service).permit(:user_id, user_ids: [])
    end
  end
end
