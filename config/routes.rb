# == Route Map
#

Rails.application.routes.draw do
  root 'top#index'
  get 'login' => 'sessions#new', as: :login
  resource :session, only: [ :create ]
end
