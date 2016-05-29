Rails.application.routes.draw do
  root 'receipts#index'
  resources :receipts, only: [:index, :create, :destroy]
end
