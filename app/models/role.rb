class Role < ApplicationRecord
  has_many :role_services, dependent: :destroy
  has_many :services, through: :role_services

  PERMISSIONS_LIST = {
    super_admin: %w[read_all create_user delete_user update_user grant_access_to_roles],
    user_admin: %w[read_all create_user update_user]
  }

  def decorated_name
    name.humanize
  end
end
