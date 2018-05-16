class SessionsController < ApplicationController
  skip_before_action :authenticate!, only: :new

  def new
  end

  def create
    if current_user.is_user?
      redirect_to cms_services_url
    else
      redirect_to cms_users_url
    end
  end

  def destroy
    warden.logout
    redirect_to :root
  end
end
