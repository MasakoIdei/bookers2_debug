Rails.application.routes.draw do
  devise_for :users
  
  root 'homes#top'
  get '/home/about' => 'homes#about'
  resources :users,only: [:show,:index,:edit,:update]
  
  resources :books do
   resource :favorites, only: [:create, :destroy]
  end
  #favoritesは投稿されたbookに対して、親子関係
 
end