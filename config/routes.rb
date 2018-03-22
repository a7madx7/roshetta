Rails.application.routes.draw do
  resources :drugs
  devise_for :users
  get 'welcome/home'

  resources :rxes
  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
