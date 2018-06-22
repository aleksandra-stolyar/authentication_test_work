Rails.application.routes.draw do
  root 'cms/services#index'
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
    resources :services, only: [:index, :edit, :update]
    controller :sessions do
      get '/login' => :new
      post '/login' => :create
      delete '/logout' => :destroy
    end
  end
end
