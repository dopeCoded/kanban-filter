Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'top/index'
  root to: 'top#index'
  resources :list, only: %i(new create edit update destroy) do
    resources :card, except: %i(index)
  end
  post 'guest_login', to: 'sessions#guest_login'
end
