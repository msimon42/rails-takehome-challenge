Rails.application.routes.draw do
  root 'application#index'

  resources :buildings, only:[:index, :show] do
    resources :offices, only:[:show]
  end

  resources :companies, only:[:show, :create, :destroy, :new] do
    resources :employees, only:[:show, :create, :destroy]
  end
end
