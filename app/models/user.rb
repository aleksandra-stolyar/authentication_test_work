require 'bcrypt'

class User < ApplicationRecord
  include BCrypt
  ROLES = %w[super_admin user_admin user].freeze
  has_secure_password

  alias_attribute :password_digest, :encrypted_password
  validates :email, presence: true
  validates :role, inclusion: { in: ROLES }

  has_and_belongs_to_many :services

  mount_uploader :avatar, AvatarUploader

  def password
    @password ||= Password.new(self.encrypted_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.encrypted_password = @password
  end
end
