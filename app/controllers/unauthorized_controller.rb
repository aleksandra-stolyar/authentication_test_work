class UnauthorizedController < ApplicationController
  def self.call(env)
    @respond ||= action(:respond)
    @respond.call(env)
  end

  def respond
    unless request.get?
      message = request.env['warden.options'].fetch(:message, 'unauthorized.user')
      flash.alert = I18n.t(message)
    end
    redirect_to new_sessions_url
    # render nothing: true, status: :unauthorized
  end
end
