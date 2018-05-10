Rails.application.routes.draw do
  root 'sessions#new'
  namespace :api do
    api_version(
      module: 'V1',
      header: { name: 'Accept', value: 'application/vnd.servicesmanager.v1+json' },
      default: true
    ) do
      resources :users, only: :show
      resources :services, only: :show
    end
  end

  namespace :cms do
    resources :users
    resources :services, only: [:index, :update] do
      get '/:id/grant_access', on: :collection, to: 'services#grant_access', as: :grant_access
    end
  end
  scope :users do
    resource :sessions, only: [:new, :create, :destroy]
  end
end
