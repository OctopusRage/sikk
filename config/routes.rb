require 'api_version'

Rails.application.routes.draw do
  # mount API::Base, at: '/'
  # mount GrapeSwaggerRails::Engine => '/docs'
  #
  # get 'secure' => 'secure#index'
  devise_for :admins
  devise_for :consumers
  devise_for :consultants

  get '/' => 'static_page#index'

  if ENV['API_SUBDOMAIN']
    subdomain_constraint = { subdomain: ENV['API_SUBDOMAIN'].split(',') }
  else
    subdomain_constraint = {}
  end
  namespace :api, path: '/', constraints: subdomain_constraint do
    scope defaults: { format: 'json' } do
      scope module: :v1, constraints: ApiVersion.new('v1', true) do
        resource :auth, only: [:create], controller: :auth
        namespace :admins do
          resources :sessions, only: [:create]
          resources :reports, only: [:index]
          resources :consultants, only: [:index]
          resources :consumers, only: [:index]
          get "category_graph" => "reports#category_graph"
        end
        namespace :consumers do
          resources :sessions, only: [:create]
          resources :reports, only: [:index, :create, :update]
        end
        namespace :consultants do
          resources :reports, only: [:index, :update]
        end
      end
    end
  end 
end