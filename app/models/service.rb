class Service < ApplicationRecord
  belongs_to :admin, -> { user_admin }, class_name: 'User', foreign_key: 'user_id'

  has_many :user_services, dependent: :destroy
  has_many :users, -> { user }, through: :user_services

  mount_uploader :logo, LogoUploader
end
