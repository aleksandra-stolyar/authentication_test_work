require 'bcrypt'

class User < ApplicationRecord
  has_secure_password

  alias_attribute :password_digest, :encrypted_password
  validates :email, presence: true,
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :password, presence: true,
                       confirmation: true

  belongs_to :role
  has_many :user_services, dependent: :destroy
  has_many :services, through: :user_services

  has_many :managed_services, foreign_key: 'user_id', class_name: 'Service'

  scope :user_admin, -> { where(role: Role.find_by(name: 'user_admin')) }
  scope :user,       -> { where(role: Role.find_by(name: 'user')) }

  mount_uploader :avatar, AvatarUploader

  def password
    @password ||= BCrypt::Password.new(encrypted_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.encrypted_password = @password
  end

  def name_with_position
    "#{full_name} | #{position}"
  end

  def own_services
    if self.is_user_admin?
      managed_services
    elsif self.is_user?
      services
    end
  end

  def method_missing(method_name, *args, &block)
    if match = role_check(method_name)
      role.name == match[1]
    else
      super
    end
  end

  def role_check(role)
    /^is?_([a-zA-Z_]*)\?$/.match(role)
  end
end
