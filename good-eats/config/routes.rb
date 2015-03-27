Rails.application.routes.draw do
  root 'restaurants#index'

  resources :restaurants, only: [:index, :new, :show]
  resources :reviews
  resources :restaurants, only: [] do
    resources :reviews, only: [:create, :new]
  end

end
