Rails.application.routes.draw do
  devise_for :users

  root to: 'top#index'

  get "companies",  to: "companies#index"

  resources :companies do
    collection { post :import }
  end
end
