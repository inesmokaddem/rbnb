Rails.application.routes.draw do
  devise_for :users
  root to: 'artists#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :artists, only: [:show, :new, :create], shallow: true do
    resources :bookings, only: [:show, :create]
  end
  patch "bookings/:id", to: "reviews#create"
  resources :bookings, only: [:index, :destroy]
end
