Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :mart_users
  resources :mart_admins
  post '/login', to: 'authentications#login'
end
