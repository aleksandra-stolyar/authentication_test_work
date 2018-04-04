Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users do
        collection do
          resource :registrations, only: [:show, :create]
          resource :sessions, only: [:new, :create, :destroy]
        end
      end
    end
  end
end
