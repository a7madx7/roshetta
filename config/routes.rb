Rails.application.routes.draw do
  resources :questions do
    resources :answers
  end
  resources :generics
  resources :patients
  resources :generics

  get 'search/for'

  get 'search/drugs'

  get 'search/rxes'

  resources :categories

  resources :companies

  resources :drugs
  devise_for :users
  resources :profiles

  get 'welcome/home', as: :home

  resources :rxes
  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
