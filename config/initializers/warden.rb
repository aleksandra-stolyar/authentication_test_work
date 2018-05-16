Rails.configuration.middleware.use RailsWarden::Manager do |manager|
  manager.default_strategies :password
  manager.failure_app = ->(env) { UnauthorizedController.action(:unauthenticated).call(env) }
end

# Declare your strategies here, or require a file that defines one.
Warden::Strategies.add(:password) do
  def valid?
    return false if request.get?
    user_data = params.fetch('session', {})
    !(user_data['email'].blank? || user_data['password'].blank?)
  end

  def authenticate!
    user = User.find_by(email: params[:session][:email])
    return success!(user) if user && user.authenticate(params[:session][:password])
    fail!(message: I18n.t('strategies.password.failed'))
  end
end
