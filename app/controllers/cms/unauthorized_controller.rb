module Cms
  class UnauthorizedController < BaseController
    skip_before_action :authenticate!

    def unauthenticated
      message = warden.message[:message] unless warden.message.nil?
      message ||= I18n.t('strategies.credentials.blank')
      respond_to do |format|
        format.html {
          flash[:alert] = message
          redirect_to cms_login_url
        }
        format.json {
          render json: { error: message }, status: :unauthorized
        }
      end
    end
  end
end
