Rails.configuration.middleware.use RailsWarden::Manager do |manager|
  manager.default_strategies :password
  manager.failure_app = Api::V1::UnauthorizedController
end

# Setup Session Serialization
class Warden::SessionSerializer
  def serialize(record)
    [record.class.name, record.id]
  end

  def deserialize(keys)
    klass, id = keys
    klass.find(:first, :conditions => { id: id })
  end
end

# Declare your strategies here, or require a file that defines one.
Warden::Strategies.add(:password) do
  def valid?
    return false if request.get?
    user_data = params.fetch("user", {})
    !(user_data["email"].blank? || user_data["password"].blank?)
  end

  def authenticate!
    user = User.authenticate(params['username'], params['password'])
    user.nil? ? fail!(message: "strategies.password.failed") : success!(user)
  end
end
