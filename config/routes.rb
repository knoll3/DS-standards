Rails.application.routes.draw do
  root 'framing#index'
  resources :framing
end
