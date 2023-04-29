Rails.application.routes.draw do
  get 'splash/index'

  devise_for :users
  root 'splash#index'

  get '/user' => "categories#index", :as => :user_root

  resources :categories ,only: [:index, :show, :new, :create] do
    resources :payments, only: [:new, :create]
  end
end