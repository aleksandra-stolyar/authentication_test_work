module Cms
  class BaseController < ::ApplicationController
    protect_from_forgery with: :exception
    before_action :verify_authenticity_token
    prepend_before_action :authenticate!

    helper_method :warden, :signed_in?, :current_user

    def record_not_found(error)
      flash[:alert] = error.to_s
      redirect_back(fallback_location: root_path)
    end

    def signed_in?
      current_user.present?
    end

    def current_user
      warden.user
    end

    def authenticate!
      warden.authenticate!
    end

    def authorize!
      return if current_user.is_super_admin?
      flash[:alert] = I18n.t('errors.messages.unauthorized')
      redirect_back(fallback_location: root_path)
    end
  end
end
