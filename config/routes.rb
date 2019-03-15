Rails.application.routes.draw do
  devise_for :users

  root to: 'welcomes#index'

  resources :events

  resources :invitations

  # post '/events/:id', to: 'invitations/create', as: :create_invitations
end
