require 'bcrypt'

class User < ApplicationRecord
  include BCrypt
  validates :email, presence: true

  mount_uploader :avatar, AvatarUploader
  ROLES = %w[super_admin user_admin user].freeze

  def password
    @password ||= Password.new(self.encrypted_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.encrypted_password = @password
  end
end
