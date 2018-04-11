class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

  prepend_before_action :authenticate!

  helper_method :warden, :signed_in?, :current_user

  def signed_in?
    !current_user.nil?
  end

  def current_user
    warden.user
  end

  def authenticate!
    warden.authenticate(:password)
  end

end
