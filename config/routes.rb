ChronicConference::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'home#index', as: :home
  # get '/columns', to: 'home#columns'
end