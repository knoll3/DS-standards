Rails.application.routes.draw do
  root 'framings#index'
  resources :framings
end
