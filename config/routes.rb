Rails.application.routes.draw do
  resources :users
  resources :tournaments
  resources :standings
  resources :admins
  resources :sessions
end
