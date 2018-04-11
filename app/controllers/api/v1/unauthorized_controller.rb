module Api
  module V1
    class UnauthorizedController < ApplicationController
      def self.call(env)
        @respond ||= action(:respond)
        @respond.call(env)
      end

      def respond
        unless request.get?
          message = request.env['warden.options'].fetch(:message, "unauthorized.user")
          flash.alert = I18n.t(message)
        end
        redirect_to new_api_default_sessions_url
        # render nothing: true, status: :unauthorized
      end
    end
  end
end
