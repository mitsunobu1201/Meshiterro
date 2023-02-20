Rails.application.routes.draw do
 
 resources :users, only: [:show,:edit,:update]
 resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  resources :post_comments, only: [:create,:destroy]
 end

 devise_for :users
 root to: "homes#top"
 get 'homes/about' => 'homes#about', as: 'about'
end
