Rails.application.routes.draw do
  get 'shops/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'reservations#index'
  resources :reservations
end
