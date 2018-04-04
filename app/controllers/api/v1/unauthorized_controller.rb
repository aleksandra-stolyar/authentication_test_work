module Api
  module V1
    class UnauthorizedController < ApplicationController
      def self.call(env)
        @respond ||= action(:respond)
        @respond.call(env)
      end

      def respond
        unless request.get?
          message = env['warden.options'].fetch(:message, "unauthorized.user")
          flash.alert = I18n.t(message)
        end

        redirect_to new_sessions_url
      end

      # def respond
      #   self.response_body = "Unauthorized Action"
      #   self.status = :unauthorized
      # end
    end
  end
end
