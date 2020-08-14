Rails.application.routes.draw do
  get 'users/:id/show', :to => "users#show"
  resources :questions
  # 最初の画面
  root 'welcome#welcome'

  # hang_out系
  resources :hang_outs do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  get "hang_outs/:id/json", :to => "hang_outs#get_json"
  get "hang_outs/:id/confirm", :to => "hang_outs#confirm_like"
  get "hang_outs/:id/confirm_destroy", :to => "hang_outs#confirm_destroy"

  # user_detail 系
  resources :user_details
  get "user_details/:id/json", :to => "user_details#get_json"
  
  # user_personal 系
  resources :user_personals
  get "user_personals/:id/json", :to => "user_personals#get_json"
  
  # フォロー系
  resources :relationships, only: [:create, :destroy]

  # Question
  get "questions/:id/json", :to => "questions#get_json"

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
    get "user/:id/follow", :to => "mypage#follow"
    get "user/:id/follower", :to => "mypage#follower"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end 
end
