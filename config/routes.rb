Rails.application.routes.draw do
  get '/search' => 'search#search'
  devise_for :users
  
  root :to => 'homes#top'
  get '/home/about' => 'homes#about'
  resources :users,only: [:show,:index,:edit,:update] do
      resource :relationships, only: [:create, :destroy]
       get 'followings' => 'relationships#followings', as: 'followings'
       get 'followers' => 'relationships#followers', as: 'followers'
  end
      
  
  
  resources :books do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy] 
  end

end