Rails.application.routes.draw do
  resources :bundles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'bundles#new'
end
