Rails.application.routes.draw do
  devise_for :users
    

  root 'stores#index'

  resources :stores do
    resources :items do
    end
  end


  resources :transactions
  resources :watched_items

  post '/stores/:id/inventories/upload' => 'inventories#upload', as: :inventories_upload

  resources :charges

end
