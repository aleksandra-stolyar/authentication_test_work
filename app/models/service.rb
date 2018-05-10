class Service < ApplicationRecord
  has_many :role_services, dependent: :destroy
  has_many :roles, through: :role_services

  mount_uploader :logo, LogoUploader
end
