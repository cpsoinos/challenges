Rails.application.routes.draw do
  root 'manufacturers#index'
  devise_for :users

  resources :manufacturers, only: [
    :index,
    :show,
    :new,
    :create
  ]

end
