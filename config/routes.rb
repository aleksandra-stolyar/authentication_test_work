Rails.application.routes.draw do

  root 'api/v1/sessions#new'
  namespace :api do
    api_version(
      module: 'V1',
      header: { name: 'Accept', value: 'application/vnd.servicesmanager.v1+json' },
      default: true
    ) do
      resources :users do
        collection do
          resource :sessions, only: [:new, :create, :destroy]
          # get '/login' => 'sessions#new'
          # post '/login' => 'sessions#create'
          # get '/logout' => 'sessions#destroy'
        end
      end
    end

  end
end
