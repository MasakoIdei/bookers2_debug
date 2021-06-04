Rails.application.routes.draw do
  devise_for :users
  
  root 'homes#top'
  get '/home/about' => 'homes#about'
  resources :users,only: [:show,:index,:edit,:update]
  
  resources :books do
   resource :favorites, only: [:create, :destroy]
   resource :post_comments, only: [:create, :destroy] 
  end
  #favoritesとpost_commentはブックに対して
 
end