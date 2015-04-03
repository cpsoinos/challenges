Rails.application.routes.draw do
  root 'manufacturers#index'
  devise_for :users

  resources :manufacturers, only: [
    :index,
    :show,
    :new,
    :create
  ]

  resources :cars, only: [
    :index,
    :show,
    :new,
    :create
  ] do
    resources :manufacturers, only: [
      :index,
      :show
    ]
  end

end
