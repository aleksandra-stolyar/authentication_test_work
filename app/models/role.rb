class Role < ApplicationRecord
  has_many :users

  def decorated_name
    name.humanize
  end
end
