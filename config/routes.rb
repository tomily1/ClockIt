# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'

  get 'register', to: 'users#new'

  # get 'timer', to: 'clock#time'

  resource :user, only: %i[create] do
    post :login
    post :logout
  end

  resources :clock, only: %i[index new create destroy] do
  end
end
