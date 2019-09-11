Rails.application.routes.draw do
  get "/services/new", to: "services#new", as: "new"
  get "/services/new_hair", to: "services#new_hair", as: "hair"
  get "/services/new_shape_up", to: "services#new_shape_up", as: "shape_up"
  get "/services/new_facial", to: "services#new_facial", as: "facial"
  get "/services/new_facial_hair", to: "services#new_facial_hair", as: "facial_hair"
  get "/services/new_extra", to: "services#new_extra", as: "extra"
  get "/signup", to: "cusotmers#new", as: "sign_up" 
  resources :appointments
  resources :barbers
  resources :shop_services
  resources :services, only:[:index,:show,:create,:update,:destroy]
  resources :barber_shops
  resources :customers

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
