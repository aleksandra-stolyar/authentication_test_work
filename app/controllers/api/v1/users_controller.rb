module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate!
      def show
        @user = User.find(params[:id])
        render json: @user
      end
    end
  end
end
