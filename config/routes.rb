Rails.application.routes.draw do
  devise_for :users

  root 'payments#index'
  resources :payments
end
