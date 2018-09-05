Rails.application.routes.draw do
  resources :home, only: [:index]

  devise_for :users
  resources :subscriptions
  resources :bundles, except: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    authenticated :user do
      root to: 'home#index', as: :authenticated_root
    end

    unauthenticated :user do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  end
end
