module Cms
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
        redirect_to cms_users_url
      end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to cms_users_url
      else
        render 'edit'
      end
    end

    private
    def user_params
      params.require(:user)
            .permit(:email, :password, :password_confirmation, :avatar, :full_name, :position, :role)
    end
  end
end
