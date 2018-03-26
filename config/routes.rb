Rails.application.routes.draw do
  root 'framings#show'
  resources :framings
end
