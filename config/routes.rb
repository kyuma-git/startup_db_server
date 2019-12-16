Rails.application.routes.draw do
  devise_for :users
  root to: "companies#index"

  resources :companies do
    collection { post :import }
  end
end
