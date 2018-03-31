Rails.application.routes.draw do

  get 'companies/update'

  root 'framings#show'
  resources :framings
  resources :companies
end
