class Service < ApplicationRecord
  has_many :services_users, dependent: :destroy
  has_many :users, through: :services_users
end
