Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'urls#index'

  resources :urls, only: [:show, :index, :create]

  get '/:shortened_url', to: 'urls#redirect', as: 'manage_redirect'
  get 'urls/not_found', to: 'urls#not_found'
end
