class RoleService < ApplicationRecord
  belongs_to :role
  belongs_to :service
end
