Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#index"

  get "register", to: "users#new"

  resource :user, only: %i[create] do
    post :login
  end

  resources :clock, only: [:index] do
    post :in
    post :out
  end
end
