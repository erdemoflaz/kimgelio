Rails.application.routes.draw do
  devise_for :users,
             controllers: {
                 registrations: 'users/registrations'
                  }

  root to: 'welcomes#index'

  resources :events

  resources :invitations

  get 'invitations/:id/accept', to: 'invitations#accept', as: 'accept_invite'
  get 'invitations/:id/decline', to: 'invitations#decline', as: 'decline_invite'

  # post '/events/:id', to: 'invitations/create', as: :create_invitations
end
