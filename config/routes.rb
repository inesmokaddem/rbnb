Rails.application.routes.draw do
  devise_for :users
  root to: 'artists#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :artists, only: [:show, :new, :create], shallow: true do
    resources :bookings, only: [:show, :create] do
      resources :reviews, only: [:create]
    end
  end
  resources :bookings, only: [:index]
end
