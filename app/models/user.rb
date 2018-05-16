require 'bcrypt'

class User < ApplicationRecord
  has_secure_password

  alias_attribute :password_digest, :encrypted_password
  validates :email, presence: true,
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :password, presence: true,
                       confirmation: true

  belongs_to :role
  delegate :services, to: :role

  mount_uploader :avatar, AvatarUploader

  def password
    @password ||= BCrypt::Password.new(encrypted_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.encrypted_password = @password
  end

  def method_missing(method_name, *args, &block)
    if match = role_check(method_name)
      role.name == match[1]
    elsif match = permission_check?(method_name)
      return true if permissions.include?(match[1])
    else
      super
    end
  end

  def role_check(role)
    /^is?_([a-zA-Z_]*)\?$/.match(role)
  end

  def permission_check?(permission)
    /^can?_([a-zA-Z_]*)\?$/.match(permission.to_s)
  end

  def permissions
    Role::PERMISSIONS_LIST[role.name.to_sym] || []
  end
end
