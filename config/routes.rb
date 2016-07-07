Rails.application.routes.draw do
  devise_for :users

  root 'stores#index'

  resources :stores do
    resources :items do
      post'/watch' => 'items#watch'
    end
    post '/upload' => 'stores#upload'
  end

  get '/watched' => 'items#watched'

  resources :transactions
  resources :inventory
  resources :charges

end
