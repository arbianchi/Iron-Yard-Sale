Rails.application.routes.draw do
  devise_for :users

  root 'stores#index'

  resources :stores do
    resources :items
  end

 resources :transactions
 resources :inventory
end


