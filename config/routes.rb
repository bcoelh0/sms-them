Rails.application.routes.draw do
  get 'messages/send'
  root to: "home#index"
  devise_for :users
  resources :lists do
    resources :contacts, only: [:create, :update, :edit, :destroy]
    resources :messages, only: [:index, :new, :create]
  end
end
