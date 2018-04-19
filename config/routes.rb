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
  end
  scope :users do
    resource :sessions, only: [:new, :create, :destroy]
  end
end
