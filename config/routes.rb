Rails.application.routes.draw do
  get "/customers/:id/profile", to: "customers#profile", as: "profile"
  get "customers/:id/edit_name", to: "customers#edit_name", as: "name_change"
  get "customers/:id/edit_age", to: "customers#edit_age", as: "age_change"
  get "customers/:id/edit_fav", to: "customers#edit_fav", as: "fav_change"
  get "customers/:id/edit_loc", to: "customers#edit_loc", as: "loc_change"
  get "customers/:id/edit_cell", to: "customers#edit_cell", as: "cell_change"
  get "/customers/:id/security", to: "customers#security", as: "security"
  get "customers/:id/edit_email", to: "customers#edit_email", as: "email_change"
  get "customers/:id/edit_pass", to: "customers#edit_pass", as: "pass_change"
  get "/services/new", to: "services#new", as: "new"
  get "/services/new_hair", to: "services#new_hair", as: "hair"
  get "/services/new_shape_up", to: "services#new_shape_up", as: "shape_up"
  get "/services/new_facial", to: "services#new_facial", as: "facial"
  get "/services/new_facial_hair", to: "services#new_facial_hair", as: "facial_hair"
  get "/services/new_extra", to: "services#new_extra", as: "extra"
  get "/signup", to: "customers#new", as: "sign_up"
  get "/logins/confirm", to: "logins#confirm", as: "confirmation"
  delete "/logout", to: "logins#destroy", as: "logout"
  resources :logins, only: [:new, :create]
  resources :appointments
  resources :barbers
  resources :shop_services
  resources :services, only:[:index,:show,:create,:update,:destroy]
  resources :barber_shops
  resources :customers, only:[:index,:show,:new,:create,:update,:destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
