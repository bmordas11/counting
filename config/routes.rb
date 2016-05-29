Rails.application.routes.draw do
  root 'receipts#index'
  resources :receipts, only: [:index, :create, :update, :destroy]
end
