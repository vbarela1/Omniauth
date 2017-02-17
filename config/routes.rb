Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  resources :trips do
    resources :locations
  end

  resources :locations do
    resources :addresses 
  end

  resources :signup

 resources :newsletter, only: [:new, :create]

end


