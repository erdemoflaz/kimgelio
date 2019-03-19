Rails.application.routes.draw do
  devise_for :users,
             controllers: {
                 registrations: 'users/registrations'
                  }
  get 'users/:id', to: 'profiles#show', as: 'user_show'
  root to: 'welcomes#index'

  resources :events do
    resources :invitations
    get 'invitations/:id/accept', to: 'invitations#accept', as: 'accept_invite'
    get 'invitations/:id/decline', to: 'invitations#decline', as: 'decline_invite'
  end



  # post '/events/:id', to: 'invitations/create', as: :create_invitations
end
