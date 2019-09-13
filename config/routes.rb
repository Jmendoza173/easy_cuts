Rails.application.routes.draw do
  get "/", to: "appointments#home", as: "homepage"
  root "appointments#home"
  
  
  get "/signup", to: "customers#new", as: "csign_up"
  get "/login_view", to: "customers#login_view", as: "clogin_view"
  post "/login", to: "customers#login", as: "clogin"
  delete "/logout", to: "customers#logout", as: "clogout"
  get "/customers/:id/profile", to: "customers#profile", as: "profile"
  get "/customers/:id/edit_name", to: "customers#edit_name", as: "name_change"
  get "/customers/:id/edit_age", to: "customers#edit_age", as: "age_change"
  get "/customers/:id/edit_fav", to: "customers#edit_fav", as: "fav_change"
  get "/customers/:id/edit_loc", to: "customers#edit_loc", as: "loc_change"
  get "/customers/:id/edit_cell", to: "customers#edit_cell", as: "cell_change"
  get "/customers/:id/security", to: "customers#security", as: "security"
  get "/customers/:id/edit_email", to: "customers#edit_email", as: "email_change"
  get "/customers/:id/edit_pass", to: "customers#edit_pass", as: "pass_change"
  
  
  get "/barbers/signup", to: "barbers#new", as: "bsign_up"
  get "/barbers/login", to: "barbers#login", as: "blogin"
  post "/barbers/log", to: "barbers#log", as: "blog"
  delete "/barbers/logout", to: "barbers#logout", as: "blogout"
  get "/barbers/:id/profile", to: "barbers#profile", as: "bprofile"
  get "/barbers/:id/edit_name", to: "barbers#edit_name", as: "name"
  get "/barbers/:id/edit_available", to: "barbers#edit_available", as: "available"
  get "/barbers/:id/edit_cash", to: "barbers#edit_cash", as: "cash"
  get "/barbers/:id/edit_card", to: "barbers#edit_card", as: "card"
  get "/barbers/:id/edit_cell", to: "barbers#edit_cell", as: "cell"
  get "/barbers/:id/edit_shop", to: "barbers#edit_shop", as: "shop"
  get "/barbers/:id/edit_specialty", to: "barbers#edit_specialty", as: "specialty"
  get "/barbers/:id/security", to: "barbers#security", as: "bsecurity"
  get "/barbers/:id/edit_email", to: "barbers#edit_email", as: "email"
  get "/barbers/:id/edit_pass", to: "barbers#edit_pass", as: "pass"


  get "/services/new", to: "services#new", as: "new"
  get "/services/new_hair", to: "services#new_hair", as: "hair"
  get "/services/new_shape_up", to: "services#new_shape_up", as: "shape_up"
  get "/services/new_facial", to: "services#new_facial", as: "facial"
  get "/services/new_facial_hair", to: "services#new_facial_hair", as: "facial_hair"
  get "/services/new_extra", to: "services#new_extra", as: "extra"

  resources :appointments
  resources :barbers, only: [:index,:show,:new,:create,:update,:destroy]
  resources :shop_services
  resources :services, only:[:index,:show,:create,:update,:destroy]
  resources :barber_shops
  resources :customers, only:[:index,:show,:new,:create,:update,:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
