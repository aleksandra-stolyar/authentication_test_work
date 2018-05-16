class UnauthorizedController < ApplicationController
  skip_before_action :authenticate!

  def unauthenticated
    unless request.get?
      message = request.env['warden.options'].fetch(:message, 'unauthorized.user').fetch(:message)
      flash[:alert] = message
    end
    redirect_to new_sessions_url
  end
end
