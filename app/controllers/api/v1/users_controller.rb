module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate!
    end
  end
end
