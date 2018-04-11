module Api
  module V1
    class SessionsController < ApplicationController
      skip_before_action :authenticate!

      def create
        authenticate!
        redirect_to api_default_users_url
      end

      def destroy
        warden.logout
        redirect_to :root
      end
    end
  end
end
