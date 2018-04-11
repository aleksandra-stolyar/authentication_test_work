module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate!

      def index
        @users = User.all
      end

      def show

      end

      def new
        @user = User.new
      end

      def create
        @user = User.new(user_params)
        if @user.save
          flash[:notice] = t("user.create.success")
          redirect_to api_default_users_url
        end
      end

      private
      def user_params
        params.require(:user).permit(:email, :password, :encrypted_password)
      end
    end
  end
end
