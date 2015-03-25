Rails.application.routes.draw do
  devise_for :users
  root 'questions#index'
  resources :questions

  resources :questions, only: [] do
    resources :answers, only: [:create]
  end

  resources :answers
end
