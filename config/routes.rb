Rails.application.routes.draw do
  devise_for :users

  root 'stores#index'

  resources :stores do
    resources :items do
      post'items/watch' => 'items#watch' 
    end
  end

  get 'items/watched' => 'items#watched'

  resources :transactions
  resources :inventory

end


