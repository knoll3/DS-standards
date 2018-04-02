Rails.application.routes.draw do

  get 'companies/update'
  get 'companies/submit'

  root 'framings#show'
  resources :framings
  resources :companies
end
