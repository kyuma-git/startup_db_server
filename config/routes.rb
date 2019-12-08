Rails.application.routes.draw do
  resources :companies do
    collection { post :import }
  end
end
