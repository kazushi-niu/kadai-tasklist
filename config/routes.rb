Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #トップページの設定
  root to: 'tasks#index'
  
  #タスク投稿用
  resources :tasks
  
  #ユーザ登録用
  get 'signup', to: 'users#new'
  resources :users, only: [:new, :create]
  
  #ログイン機能用
  get 'login', to: 'session#new'
  post 'login', to: 'session#create'
  delete 'logout', to: 'session#destroy'
end
