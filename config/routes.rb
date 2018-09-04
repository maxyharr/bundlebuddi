Rails.application.routes.draw do
  resources :subscriptions
  resources :bundles, except: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'bundles#new'
end
