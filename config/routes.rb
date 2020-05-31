Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  resources :lists do
    resources :contacts, only: [:create, :update, :edit, :destroy]
  end
end
