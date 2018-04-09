Rails.application.routes.draw do

  root 'api/v1/sessions#new'
  namespace :api do
    api_version(
      module: 'V1',
      header: { name: 'Accept', value: 'application/vnd.servicesmanager.v1+json' },
      default: true,
      defaults: { format: :json }
    ) do
      resources :users do
        collection do
          resource :sessions, only: [:new, :create, :destroy]
        end
      end
    end

  end
end
