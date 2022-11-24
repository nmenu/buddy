Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  resources :offers, only: [:index, :new, :create, :show]
  resources :bookings

  resources :offers, only: :destroy

end
