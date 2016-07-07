Rails.application.routes.draw do
  devise_for :users

  root 'stores#index'

  resources :stores do
    resources :items do
      resources :watched_items
    end
  end


  resources :transactions

  post '/stores/:id/inventories/upload' => 'inventories#upload', as: :inventories_upload

  resources :charges

end
