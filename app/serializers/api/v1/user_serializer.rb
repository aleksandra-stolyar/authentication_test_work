module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :id, :email, :role, :full_name, :avatar, :position
      has_many :services
    end
  end
end
