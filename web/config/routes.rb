Rails.application.routes.draw do
  resources :hang_outs
  resources :relationships, only: [:create, :destroy]
  get 'mypage/show'
  root 'welcome#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "user/:id", :to => "mypage#show"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end 
end
