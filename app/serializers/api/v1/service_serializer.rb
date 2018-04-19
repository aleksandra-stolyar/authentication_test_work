module Api
  module V1
    class ServiceSerializer < ActiveModel::Serializer
      attributes :id, :name, :logo, :link
      has_many :users
    end
  end
end
