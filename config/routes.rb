Rails.application.routes.draw do
  resources :subscriptions
  resources :bundles, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'bundles#new'
end
