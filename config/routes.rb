Rails.application.routes.draw do

  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :bookcomments, only: [:create, :destroy]
  end

  resources :users do
   resource :relationships, only: [:create, :destroy]
   get 'relationships/followers' => 'relationships#followers', as: 'followers'
   get 'relationships/followings' => 'relationships#followings', as: 'followings'
  end
end