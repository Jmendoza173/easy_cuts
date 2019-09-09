Rails.application.routes.draw do
  resources :appointments
  resources :barbers
  resources :shop_services
  resources :services
  resources :barber_shops
  resources :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
