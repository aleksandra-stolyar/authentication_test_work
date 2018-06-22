module Cms
  class ServicesController < BaseController
    before_action :authorize!, except: :index, if: -> { current_user.is_user? }

    def index
      @services= current_user.is_super_admin? ? Service.all : current_user.own_services
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
