module Cms
  class UsersController < ApplicationController
    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        flash[:notice] = t('user.create.success')
        redirect_to cms_users_url
      else
        flash[:alert] = @user.errors.full_messages.uniq
        @reset_user = User.new(user_params.except(:email, :password_confirmation))
        render new_cms_user_path(@reset_user)
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
            .permit(:email, :password, :password_confirmation, :avatar, :full_name, :position, :role_id)
    end
  end
end
