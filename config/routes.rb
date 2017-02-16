Rails.application.routes.draw do

devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

root 'home#index'

resources :trips do
  resources :locations
end

resources :locations do
  resources :addresses 
end

end


