class Service < ApplicationRecord
  belongs_to :admin, -> { user_admin }, class_name: 'User'
  has_many :users, -> { user }

  mount_uploader :logo, LogoUploader
end
