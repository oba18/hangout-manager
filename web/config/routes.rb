Rails.application.routes.draw do
  # 最初の画面
  root 'welcome#welcome'

  # hang_out系
  resources :hang_outs do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  get 'hang_outs#get_json'
  
  # フォロー系
  resources :relationships, only: [:create, :destroy]

  # マイページ系
  get 'mypage/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # devise系
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  # ログイン系
  devise_scope :user do
    get "user/:id", :to => "mypage#show"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end 
end
