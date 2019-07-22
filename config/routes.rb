Rails.application.routes.draw do

  root 'recipes#index'
  resources :measurements
  resources :ingredients
  resources :categories
  resources :recipes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
