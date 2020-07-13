Rails.application.routes.draw do
  root 'application#index'

  resources :buildings, only:[:index, :show] do
    resources :offices, only:[:show]
  end

  resources :companies, only:[:index, :show, :create, :destroy, :new] do
    resources :employees, only:[:show, :create, :destroy, :new]
    resources :company_offices, only:[:new, :create]
  end
end
