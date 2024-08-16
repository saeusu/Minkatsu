Rails.application.routes.draw do
  # devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  #   sessions: "admin/sessions"
  # }
  
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  root to: "homes#top"
  get '/about' => 'homes#about'
  
  scope module: :public do
    get 'users/mypage' => 'users#show', as:'mypage'
    get 'users/information/edit' => 'users#edit', as: 'edit_information'
    patch 'users/information' => 'users#update', as: 'update_information'
    get 'users/unsubscribe' => 'users#unsubscribe'
    put 'users/information' => 'users#update'
    patch 'users/withdraw' => 'users#withdraw', as: 'withdraw_user'
    
    resources :posts
    
  end
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    get '/' => 'homes#top'
    resources :posts
    resources :genres, only: [:index, :create, :edit, :update]
    resources :users, only: [:show, :edit, :update]
  end
    devise_scope :admin do
    get '/admin/sign_out', to: 'admin/sessions#destroy'
  end
  
end
