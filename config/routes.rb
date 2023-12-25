Rails.application.routes.draw do
  get 'users/edit'
  get 'users/update'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'top/index'
  root to: 'top#index'
  resources :list, only: %i[new create edit update destroy] do
    resources :card, except: %i[index]
  end
  post 'guest_login', to: 'sessions#guest_login'
  post '/card/:id/update_list', to: 'card#update_list', as: 'update_card_list'
  get 'list/ids', to: 'list#ids'
  post 'update-list-order', to: 'list#update_order'
  resource :user, only: %i[edit update]
end
