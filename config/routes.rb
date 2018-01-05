C21Invite::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'home#index', as: :home
  post '/submit', to: 'home#submit'
  get '/background', to: 'home#backgroundtest'
  # get '/columns', to: 'home#columns'
end