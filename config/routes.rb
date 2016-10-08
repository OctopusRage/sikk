require 'api_version'

Rails.application.routes.draw do
  # mount API::Base, at: '/'
  # mount GrapeSwaggerRails::Engine => '/docs'
  #
  # get 'secure' => 'secure#index'
  # get 'secure/logout' => 'secure#logout'
  if ENV['API_SUBDOMAIN']
    subdomain_constraint = { subdomain: ENV['API_SUBDOMAIN'].split(',') }
  else
    subdomain_constraint = {}
  end
  namespace :api, path: '/', constraints: subdomain_constraint do
    scope defaults: { format: 'json' } do
      scope module: :v1, constraints: ApiVersion.new('v1', true) do
        namespace :admins do
          resources :sessions, only: [:create]
        end
        namespace :consumers do
          resources :sessions, only: [:create]
        end
      end
    end
  end 
end